function evaluateRenderRules(renderRule, dataJson, ctxIds, ruleResCache, flCache){
	console.log('Evaluating render rules...');
	let rulePassed = true;
	let ruleCtxPath = renderRule.contextPath;
	let repPaths = [];
	let ctxIdArr = [];
	let ctxIdTree = {};
	let currCtxIdTree = ctxIdTree;
	let ctxIdMap = {};
	if(ruleCtxPath){
		let pathSplit = ruleCtxPath.split('.');
		for(let p of pathSplit){
			if(p.indexOf('$') > 0){
				repPaths.push(p);
				
				currCtxIdTree[p] = {totalRecords:0, resolved:false, ids:[]};
				currCtxIdTree = currCtxIdTree[p];
				
				if(ctxIds[p]){
					ctxIdArr.push(ctxIds[p]);
					ctxIdMap[p] = ctxIds[p];
					
					currCtxIdTree.totalRecords = 1;
					currCtxIdTree.resolved = true;
					currCtxIdTree.ids.push(ctxIds[p]);
				}				
			}
		}
	}
	
	let cachedResults = ruleResCache[renderRule.ruleId];
	if(Array.isArray(cachedResults) && cachedResults.length > 0){
		if(repPaths.length == 0){
			return cachedResults[0].result
		} else {
			let currCtxIdStr = ctxIdArr.join('|');
			let currCtxRes = cachedResults.find(res=>res.ctxIdStr===currCtxIdStr);				
			
			if(currCtxRes) {
				return currCtxRes.result;
			}
		}		
	}
	
	
	try{		
		rulePassed = evaluateRuleOnCtxPaths(renderRule, dataJson, repPaths, ctxIdMap, ctxIdTree, ruleResCache, flCache, false);
	}catch(err){
		console.log('Error while evaluating the rule: ' + renderRule.ruleId)
		
	}
	return rulePassed;
}

function evaluateRuleOnCtxPaths(renderRule, dataJson, repPaths, ctxIds, ctxIdTree, ruleResCache, flCache, anyOneMatch){
	let ruleResult = false;
	let ruleExp = renderRule.ruleExpression;
	if(repPaths.length > 0 && Object.keys(ctxIds).length === repPaths.length){
		//ALl the multi-context pats are resolved
		ruleResult = evaluateRuleExpression(ruleExp, dataJson, ctxIds, flCache);
		
		let resCtxIdArr = [];
		let ctxIdMap = {};
		for(let repP of repPaths){
			if(ctxIds[repP]){
				resCtxIdArr.push(ctxIds[repP]);
				ctxIdMap[repP] = ctxIds[repP];
			}
		}
		
		if(!ruleResCache[renderRule.ruleId]){
			ruleResCache[renderRule.ruleId] = [];
		}
		ruleResCache[renderRule.ruleId].push({ctxIdStr:resCtxIdArr.join('|'), ctxPaths:ctxIdMap, result:ruleResult});
		
	} else {
		//Iterate the ctxIdTree and resolve one by one and cache the result.
	}
	
	return ruleResult;
}

function evaluateRuleExpression(ruleExp, dataJson, ctxIds, flCache){
	
	if((!Array.isArray(ruleExp.conditions) || ruleExp.conditions.length === 0) && 
		(!Array.isArray(ruleExp.expressions) || ruleExp.expressions.length === 0)){
		return true;
	}
	
	
	let logic = ruleExp.logic === 'OR' ? 'OR' : 'AND';
	let currExpRes = logic === 'OR' ? false : true;
	let condArr = ruleExp.conditions;
	for(let c of condArr){
		
		let conddRes = evaluateRuleExpCondition(c, dataJson, ctxIds, flCache);
		if((logic == 'AND' && !conddRes) || (logic == 'OR' && conddRes)){
			currExpRes = conddRes;
			break;
		}
	}
	
	if((logic == 'AND' && currExpRes) || (logic == 'OR' && !currExpRes)){
		let expressions = ruleExp.expressions;
		for(let e of expressions){
			let expRes = evaluateRuleExpression(e, dataJson, ctxIds, flCache);
			if((logic == 'AND' && !expRes) || (logic == 'OR' && expRes)){
				currExpRes = expRes;
				break;
			}
		}
	}
	
	return currExpRes;
}

function evaluateRuleExpCondition(condObj, dataJson, ctxIds, flCache){
	
	let lhsFlMd = condObj.lhsFieldId && flCache[condObj.lhsFieldId];
	let opr = condObj.operator || 'eq';
	let rhsVal = condObj.rhsValue || 'null';
	
	if(!lhsFlMd){
		return true;
	}
	
	let fieldMeta = flCache[condObj.lhsFieldId];
	const lhsVal = _getFieldValue(lhsFlMd, dataJson, ctxIds) || 'null';
	
	return evaluateRuleExpConddData(lhsVal, opr, rhsVal);
}

function evaluateRuleExpConddData(lhsVal, opr, rhsVal){
	let evalRes = false;
	let lhsArr = lhsVal.split('|');
	let rhsArr = rhsVal.split('|')
	switch(opr){
		case 'in':
		case 'notin':
		case 'neq':
		case 'eq' :
			evalRes = false;
			for(lv of lhsArr){
				for(rv of rhsArr){
					if(lv == rv){
						evalRes = true;
						break;
					}
				}
				if(evalRes){
					break
				}
			}
			if(opr === 'neq' || opr === 'notin')evalRes = !evalRes;
			
			break;
		
	}
	
	
	return evalRes;
}


function getMultiCtxPathArr(fieldPath){
	let repPaths = [];
	let pathSplit = fieldPath.split('.');
	for(let p of pathSplit){
		if(p.indexOf('$') > 0){
			repPaths.push(p);			
		}
	}
	return repPaths;
}

function getMultiCtxIdStr(multiCtxPathArr, ctxIds){
	
	let resCtxIdArr = [];
	let ctxIdMap = {};
	for(let repP of multiCtxPathArr){
		if(ctxIds[repP]){
			resCtxIdArr.push(ctxIds[repP]);			
		}
	}
	return resCtxIdArr.join('|');
}
