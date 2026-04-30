/* ============================================================
     INDIVIDUAL RENDERERS based on field metadata
	 
	Field Metadata:
		id, module_id, table_id, field_id, column_name, field_name, listing_alias, data_type, max_length, required, field_path
		label
		ui_metadata_json: 
			label_info : "", 
			description: "", 
			render_as: "text/textarea/numeric/date/combo/ms-combo/radio/checkbox/bool-switch/lookup/ms-lookup/type-ahead/html-editor"
			codelist: "codelist id",
			dataValues:[],//instead of codeist static data values array with code and decode can be maintained.
			lookup_module:"module ID of the _renderLookup module",
				storeValField: "data json field name where the store value for lookup needs to be stores",
				lkpStoreField: "field name of lookup records which is used for store value",
				lkpDispField: "field name of lookup records which is used for display value",
				storeFormat:"JSON/TEXT"
				
			nf_field, nf_codelist, sf_field, part_date_info, 
		
     ============================================================ */



function _buildInput(fieldMeta, dataJson, ctxIds) {
    const renderAs = fieldMeta.renderAs || 'text';
    const val = _getFieldValue(fieldMeta, dataJson, ctxIds) || '';

    switch (renderAs) {
        case 'text':
			return _renderText(fieldMeta, val);
        case 'textarea':            
        case 'html-editor':
            return _renderTextarea(fieldMeta, val);
        case 'numeric':
            return _renderNumeric(fieldMeta, val);
        case 'date':
            return _renderDate(fieldMeta, val);
        case 'combo':
            return _renderCombo(fieldMeta, val);
        case 'ms-combo':
            return _renderMultiCombo(fieldMeta, val, dataJson, ctxIds);
        case 'radio':
            return _renderRadio(fieldMeta, val);
        case 'checkbox':
            return _renderCheckbox(fieldMeta, val);
        case 'bool-switch':
            return _renderSwitch(fieldMeta, val);
        case 'lookup':
            return _renderLookup(fieldMeta, val, dataJson, ctxIds);
		case 'ms-lookup':
            return _renderLookup(fieldMeta, val, dataJson, ctxIds);
        case 'type-ahead':
            return _renderText(fieldMeta, val);
        default:
            return _renderText(fieldMeta, val);
    }
}

function _renderText(fieldMeta, val) {
    let ip = [];
    ip.push(`<input 
		class="md-input" 
		type="text"
		fieldId=${fieldMeta.fieldId}
		maxlength="${fieldMeta.maxLen || 300}"
		${fieldMeta.readOnly && 'readonly'}
		${fieldMeta.disabled && 'disabled'}
		placeholder="${fieldMeta.placeholder || ''}"
		value="${val}"
	/>`)

    return ip.join('');
}

function _renderNumeric(fieldMeta, val) {
    let ip = [];
    ip.push(`<input 
		class="md-input" 
		type="number"
		fieldId=${fieldMeta.fieldId}
		${fieldMeta.readOnly && 'readonly'}
		${fieldMeta.disabled && 'disabled'}
		value="${val}"
	/>`);
    return ip.join('');
}


function _renderDate(fieldMeta, val) {
	let ip = [];
    ip.push(`<div class="md-date-wrapper">
			  <input class="md-input md-date-input"  type="date" fieldId=${fieldMeta.fieldId} 
				${fieldMeta.readOnly && 'readonly'}
				${fieldMeta.disabled && 'disabled'}
				value="${val}"
			  />
			  <div class="md-date-mask">
				<span class="md-date-text">${_getDateInDDMMMYYYY(val)}</span>
				<span class="md-calendar-icon">📅</span>
			  </div>
			</div> 
			`);
	
   return ip.join('')
}
function _getDateInDDMMMYYYY(flData){
	if(!flData){
		return AppI18N.t('Select Date')
	}
	try{
		return new Date(flData).toLocaleDateString("en-GB", {
			day: "2-digit",
			month: "short",
			year: "numeric"
		  }).replace(/ /g, "/");
	}catch(e){
		
	}
	return AppI18N.t('Select Date')
}

function _renderTextarea(fieldMeta, val) {
    let ip = [];
    ip.push(`<textarea 
		class="md-input" 
		fieldId=${fieldMeta.fieldId}
		maxlength="${fieldMeta.maxLen || 300}"
		${fieldMeta.readOnly && 'readonly'}
		${fieldMeta.disabled && 'disabled'}
		value="${val}">${val || ''}</textarea>
	`);
    return ip.join('');
}

function _renderCombo(fieldMeta, val) {
	let ip = [];
	let clValues = (fieldMeta.codelist && AppCL.values(fieldMeta.codelist)) || [];
	if(clValues.length == 0 && Array.isArray(fieldMeta.dataValues)){
		clValues = fieldMeta.dataValues;
	}
	ip.push('<select class="md-input" fieldId="'+fieldMeta.fieldId+'" '+(fieldMeta.readOnly ? " disabled" : "")+ (fieldMeta.disabled ? " disabled" : "")+ '>');
	ip.push('	 <option value="" '+(!val && "selected")+'>'+AppI18N.t('--select--')+'</option>');
	for(cl of clValues){
		if(cl.code && cl.decode){
			ip.push('<option value="'+cl.code+'" '+(cl.code == val && "selected")+'>'+AppI18N.clT(cl.code, fieldMeta.codelist, cl.decode)+'</option>');
		}		
	}
    ip.push('</select>')

    return ip.join('');
}

function _renderRadio(fieldMeta, val) {
	let ip=[];
	let clValues = (fieldMeta.codelist && AppCL.values(fieldMeta.codelist)) || [];
	if(clValues.length == 0 && Array.isArray(fieldMeta.dataValues)){
		clValues = fieldMeta.dataValues;
	}
	
	ip.push('<div class="radio-wrap" style="display:flex;gap:12px;flex-wrap:wrap;padding-top:6px;">');
    //Radio options
	for(cl of clValues){
		if(cl.code && cl.decode){
			ip.push('<label class="md-clk-input" style="display:flex;align-items:center;gap:6px;font-size:13px;cursor:pointer;">');
			ip.push(`	<input type="radio" name="${fieldMeta.codelist}" value="${cl.code}" ${val == cl.code && 'checked'} ${fieldMeta.readOnly && 'disabled'} ${fieldMeta.disabled && 'disabled'} fieldId="${fieldMeta.fieldId}" style="width:16px;height:16px;cursor:pointer;"/>${AppI18N.clT(cl.code, fieldMeta.codelist, cl.decode)}`);		
			ip.push('</label>');
		}
	}	
	ip.push('</div>')    
    return ip.join('');
}

function _renderCheckbox(fieldMeta, val) {
	let ip=[];
	let clValues = (fieldMeta.codelist && AppCL.values(fieldMeta.codelist)) || [];
	if(clValues.length == 0 && Array.isArray(fieldMeta.dataValues)){
		clValues = fieldMeta.dataValues;
	}
	
	ip.push('<div class="radio-wrap" style="display:flex;align-items:center;gap:8px;height:36px;">');
    //Radio options
	for(cl of clValues){
		if(cl.code && cl.decode){
			ip.push('<label class="md-clk-input" style="display:flex;align-items:center;gap:6px;font-size:13px;cursor:pointer;">'+AppI18N.clT(cl.code, fieldMeta.codelist, cl.decode));
			ip.push('	<input type="checkbox" name="'+fieldMeta.codelist+'" value="'+cl.code+'" '+(fieldMeta.readOnly ? " disabled" : "")+ (fieldMeta.disabled ? " disabled" : "") +' fieldId="'+fieldMeta.fieldId+'" style="width:16px;height:16px;cursor:pointer;"/>');		
			ip.push('</label>');
		}
	}	
	ip.push('</div>')    
    return ip.join('');
}

function _renderSwitch(fieldMeta, val) {
	let ip=[];
	ip.push('<div class="md-switch" fieldId="'+fieldMeta.fieldId+'">');
	ip.push('	<div class="md-switch__track '+ (val && (val == 'Y' || val == '1') && ' on') +'">');
	ip.push('		<div class="md-switch__thumb"></div>');
	ip.push('	</div>');
	ip.push('</div>')
    
    return ip.join('');
}

function _renderLookup(flMd, val, dataJson, ctxIds) {
    const isReadonly = flMd.readOnly || flMd.disabled;
	let flPath = flMd?.fieldPath;
	let multiSel = flMd.renderAs === 'ms-lookup' ? true : false;
	let storeFormat = flMd.storeFormat === 'JSON' ? 'JSON' : 'TEXT';
	let flName = flPath.indexOf('.') > 0 ? flPath.substr(flPath.lastIndexOf('.')+1) : flPath;
	let dispValField = flMd.dispValField;
	let lkpStoreValField = flMd.lkpStoreValField || 'id';
	let lkpDispValField = flMd.lkpDispValField || lkpStoreValField;
			
	let secPath = flPath.indexOf('.') > 0 ? flPath.substr(0, flPath.lastIndexOf('.')) : null;
	let ctxObj = (dataJson && getCtxByPath(secPath, dataJson, ctxIds)) || {};
	let dispVals = [];
	let storeVals = [];
	
	if(multiSel){		
		if('JSON' === storeFormat){			
			try{
				let jsonArr = JSON.parse(ctxObj[flName]);
				if(Array.isArray(jsonArr) && jsonArr.length > 0){
					for(let o of jsonArr){
						if(lkpStoreValField != lkpDispValField){
							dispVals.push(o.dispVal)
							storeVals.push(o.storeVal)
						} else {
							dispVals.push(o)
							storeVals.push(o)
						}						
					}
				}
			} catch(err){
				
			}
		} else {
			storeVals = ctxObj[flName].split('|');
			dispVals = ctxObj[flName].split('|');
		}
	} else if(ctxObj[flName]){		
		dispVals.push(ctxObj[flName]);
		storeVals.push(ctxObj[flName]);		
	}
	if(dispVals.length != storeVals.length){
		dispVals = storeVals;
	}
    
	let ip = []	
	ip.push('<div class="md-lookup" fieldId="'+flMd.fieldId+'">');
	
	//textBox wrapper
	ip.push('  <div class="md-lkp__control">');
	ip.push('	<div class="md-lkp__tags">');
	
	//render selected combo values
	ip.push(_getLkpSelValTags(storeVals, dispVals))
	
	ip.push('	</div>');
	ip.push('	<span class="md-lookup__lens">'+MDUtils.icon('lookup')+'</span>');/*lookup icon*/
	ip.push('  </div>');	
	ip.push('</div>');
	
	return ip.join('')
}

function _getLkpSelValTags(storeVals, dispVals){
	let ip = []	
	if(storeVals.length > 0){
		for(let i=0;i<storeVals.length; i++){
			ip.push(`<div class="md-lkp__tag" value-index="${i}" title="${dispVals[i]}"><label>${dispVals[i]}</label><span class="md-lkp__tag-remove md-lookup-clear">${MDUtils.icon('close')}</span></div>`);
		}
	} else {
		ip.push(AppI18N.t('Click lookup icon to select...'))
	}
	return ip.join('')
}

function _renderMultiCombo(flMd, val, dataJson, ctxIds) {
	//<div class="md-msc__tag">Phase I<span class="md-msc__tag-remove"><svg viewBox="0 0 24 24" style="width:10px;height:10px;stroke:currentColor;fill:none;stroke-width:2.5;stroke-linecap:round;"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span></div>
	let selVals = {};
	let selValArr = val ? val.split('|') : [];		
	
	let ip = [];
	let clValues = (flMd.codelist && AppCL.values(flMd.codelist)) || [];
	let clValMap = {};
	if(clValues.length == 0 && Array.isArray(flMd.codelistVal)){
		clValues = flMd.codelistVal;
	}
	for(let c of clValues){
		clValMap[c.code] = c;
	}
	
	let storeFormat = flMd.storeFormat === 'FIELDS' ? 'FIELDS' : 'TEXT'
	let storeFlMapping = storeFormat === 'FIELDS' && flMd.storeFieldMappings;
	if(storeFlMapping && Object.values(storeFlMapping).length > 0){
		let flPath = flMd.fieldPath;
		let secPath = flPath.indexOf('.') > 0 ? flPath.substr(0, flPath.lastIndexOf('.')) : null;
		let ctxObj = getCtxByPath(secPath, dataJson, ctxIds);
		selValArr = [];
		for(let code in storeFlMapping){
			let flName = storeFlMapping[code];
			if(flName && ctxObj[flName] == 'Y'){
				selValArr.push(code);
			}
		}
	}
	
	ip.push('<div class="md-msc" fieldId="'+flMd.fieldId+'">');
	
	//textBox wrapper
	ip.push('  <div class="md-msc__control">');
	ip.push('	<div class="md-msc__tags">');
	
	//render selected combo values
	if(selValArr.length > 0){
		for(let v of selValArr){
			selVals[v] = true;
			ip.push(`<div class="md-msc__tag" value="${v}">${clValMap[v] ? AppI18N.clT(v, flMd.codelist) : v}<span class="md-msc__tag-remove md-ms-combo-clear">${MDUtils.icon('close')}</span></div>`);
		}
	} else {
		ip.push(AppI18N.t('Select...'))
	}
	
	ip.push('	</div>');
	ip.push('	<span class="md-msc__chevron md-ms-combo-down">' + MDUtils.icon('sortDesc') + '</span>');/*combo icon*/
	ip.push('  </div>');
	
	//combo menu drawer
	ip.push('  <div class="md-msc__panel" style="display: none;">');
	
	//Combo drawer search component
	ip.push('	<div class="md-msc__search-wrap">');
	ip.push('		<span class="md-msc__search-icon">' + MDUtils.icon('searchPrefix') + '</span>');
	ip.push('		<input class="md-msc__search md-ms-combo-search" type="text" placeholder="Search…" autocomplete="off">');
	ip.push('	</div>');
	
	//combo drawer options
	ip.push('	<div class="md-msc__options">');
	//ip.push(_getMsComboOptions(clValues, selVals, flMd));	
	ip.push('  	</div>');
	
	ip.push(' </div>');
		
	ip.push('</div>');
	
	return ip.join('')
}

function _getMsComboOptions(clValues, selVals, flMd){
	let opt = [];
	for(let o of clValues){
		opt.push(`  <div class="md-msc__option" value="${o.code}">
					<span class="md-msc__chk">${selVals[o.code] ? MDUtils.icon('select') : ''}</span>
					<span class="md-msc__opt-label">${AppI18N.clT(o.code, flMd.codelist)}</span>
				  </div>`);
	}
	return opt.join('')
	
}

function _renderTypeAhead(fieldMeta, val) {
    const wrap = ce('div', 'md-typeahead');
    const input = ce('input', 'md-input');
    input.value = val || '';
    input.placeholder = 'Type to search...';
    if (opts.readOnly || opts.disabled) input.disabled = true;

    const dropdown = ce('div', 'md-typeahead__dropdown');
    wrap.appendChild(input);
    wrap.appendChild(dropdown);

    const doSearch = debounce(async (query) => {
        if (!query || query.length < 2) {
            dropdown.classList.remove('open');
            return;
        }
        // Mock search
        dropdown.innerHTML = '';
        const mockResults = [
            {label: `${query} - Result 1`, value: `${query}_1`},
            {label: `${query} - Result 2`, value: `${query}_2`},
        ];
        for (const r of mockResults) {
            const opt = ce('div', 'md-typeahead__option', r.label);
            opt.addEventListener('click', () => {
                input.value = r.label;
                dropdown.classList.remove('open');
                _handleChange(fieldMeta, r.value, contextRecord, contextPath, onChange);
            });
            dropdown.appendChild(opt);
        }
        dropdown.classList.add('open');
    }, 300);

    input.addEventListener('input', () => doSearch(input.value));
    input.addEventListener('blur', () => setTimeout(() => dropdown.classList.remove('open'), 200));
    return wrap;
}


function _renderPartialDate(fieldMeta, val) {
    const parsed = val ? String(val).split('-') : ['', '', ''];
    const wrap = ce('div', 'md-partial-date');

    const yearInput = ce('input', 'md-input');
    yearInput.type = 'number';
    yearInput.placeholder = 'YYYY';
    yearInput.style.width = '80px';
    yearInput.value = parsed[0] || '';
    yearInput.min = '1900';
    yearInput.max = '2100';

    const monthSel = ce('select', 'md-input');
    monthSel.style.width = '80px';
    const months = ['--', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    months.forEach((m, i) => {
        const o = ce('option', '', m);
        o.value = i === 0 ? '' : String(i).padStart(2, '0');
        if (parsed[1] === o.value) o.selected = true;
        monthSel.appendChild(o);
    });

    const dayInput = ce('input', 'md-input');
    dayInput.type = 'number';
    dayInput.placeholder = 'DD';
    dayInput.style.width = '60px';
    dayInput.value = parsed[2] || '';
    dayInput.min = '1';
    dayInput.max = '31';

    const buildVal = () => {
        const y = yearInput.value;
        const m = monthSel.value;
        const d = dayInput.value;
        return [y, m, d].filter(Boolean).join('-');
    };

    [yearInput, monthSel, dayInput].forEach(el => {
        if (opts.readOnly || opts.disabled) el.disabled = true;
        el.addEventListener('change', () => _handleChange(fieldMeta, buildVal(), contextRecord, contextPath, onChange));
    });

    wrap.appendChild(yearInput);
    wrap.appendChild(monthSel);
    wrap.appendChild(dayInput);
    return wrap;
}
