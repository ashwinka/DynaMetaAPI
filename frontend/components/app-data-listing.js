(function(global){
	
	console.log('Initializing App Data Listing Component')
	//Lookup registry
	let _lkpModuleId = null;
	let _lkpMetadata = null;
	let _lkpDataRecs = [];		
	let _lkpSelRecs = {};
	let _lkpFilterRecs = [];
	let _lkpTotRecs = 0;	
	let _lkpPageLimit = 25;
	let _lkpPageIndex = 0;
	let _lkpSortField = null;
	let _lkpSortDir = 'ASC';
	let _lkpCriterias = {};
	let _lkpCallBack = null;
	
	//Listing registry
	let _moduleId = null;
	let _metadata = null;
	let _dataRecs = [];
	let _filterRecs = [];
	let _totRecs = 0;
	let _selRecs = [];
	let _pageLimit = 25;
	let _pageIndex = 0;
	let _sortField = null;
	let _sortDir = 'ASC';
	let _listCriterias = [];
	
	
	//Initialize the listing-panel
	function selectLookupRow(chkCmp){
		let selRowId = $(chkCmp).parents('.ls-data-rec').attr('id');
		let selRec = _lkpDataRecs.find(r=>r.id==selRowId);
		if(!selRowId || !selRec){
			return;
		}
		if(chkCmp.checked){
			_lkpSelRecs[selRec.id] = selRec;
		} else {
			delete _lkpSelRecs[selRec.id];
		}
		
	}
	
	function selectLookupRecords(){
		if(_lkpCallBack){
			_lkpCallBack(Object.values(_lkpSelRecs));
		}
	}
	
	
	function setListingPageSize(inptCmp){
		let isLookup = $('.listing-container .ls-pagination-bar').has(inptCmp)[0] ? false : true;
		let isClientModel = false;
		if(isLookup){
			_lkpPageIndex = 0;
			_lkpPageLimit = inptCmp.value;
			isClientModel = !_lkpMetadata.dataModel || _lkpMetadata.dataModel === 'client';
		} else {
			_pageIndex = 0;
			_pageLimit = inptCmp.value;
			isClientModel = !_metadata.dataModel || _metadata.dataModel === 'client';
		}
		
		if(isClientModel){			
			_renderListingGridBody(isLookup);
		} else {
			fetchListingRecords(isLookup);
		}
		
	}
	
	function _deriveWidgetValues(){
		
	}
	
	function _buildWidgets(md){
		var widgets = md.DASHBOARD_WIDGETS || [];
		if (!widgets.length) {return []; }

		let widgetHtml = [];
		widgetHtml.push('<div class="ls-widgets">');
		
		for (var i = 0; i < widgets.length; i++) {
			var w    = widgets[i];
		  
			widgetHtml.push('	<div class="ls-widget-card">');
			//Icon
			widgetHtml.push('		<div class="ls-widget-icon" ' + (w.iconColor || 'blue') + '<svg viewBox="0 0 24 24"><path d="' + (w.icon || '') + '"/></svg></div>');
		  
			widgetHtml.push('		<div class="ls-widget-info">');
			widgetHtml.push('			<div class="ls-widget-value" id="wv_' + w.widgetId +'"> 0 </div> ');
			widgetHtml.push('			<div class="ls-widget-label"> ' + (w.label || '') +' </div>');
			widgetHtml.push('		</div>');
		  
			widgetHtml.push('</div>');
		}
		widgetHtml.push('</div>');		
		return widgetHtml.join('');		
	}
	
	
	
	function renderFilterFields(f, mdId){
		let flHtml = [];
		let flLabel = AppI18N.mT(f.label, mdId);
		flHtml.push('<div class="ls-filter-field">');
		flHtml.push('	<label class="ls-filter-label">'+flLabel+'</label>');
		flHtml.push(_buildInput(f));		
		flHtml.push('</div>');
		
		return flHtml.join('')
	}
	
	/* ══════════════════════════════════════════════════════════════════
     VALUE RESOLUTION
  ══════════════════════════════════════════════════════════════════ */
	function _getVal(record, path) {
		if (!path || !record) return '';
		var parts = path.replace(/\$\s*$/, '').split('.');
		var cur = record;
		for (var i = 0; i < parts.length; i++) {
		  if (cur === null || cur === undefined || typeof cur !== 'object') return '';
		  cur = cur[parts[i]];
		}
		if (Array.isArray(cur)) return cur.length;
		return (cur === null || cur === undefined) ? '' : cur;
	}
  
	/* ══════════════════════════════════════════════════════════════════
     CELL RENDERING
  ══════════════════════════════════════════════════════════════════ */
	function _renderCell(field, record) {
		let cell = [];
		var raw      = _getVal(record, field.fieldPath);
		var renderAs = field.renderAs || 'text';

		if (renderAs === 'badge') {
			let badgeMap = field.badgeMapper;
			let badgeCss = (badgeMap && badgeMap[flVal]) || 'priority-3';			
		
			cell.push('<span class="ls-badge '+badgeCss+'">')			
			if (raw === '' || raw === null || raw === undefined) {
				cell.push('-')
			} else {
				cell.push('<span class="ls-dot"></span>');
				cell.push(AppI18N.clT(raw, field.codelist));
			}
			cell.push('</span>');		  

		} else if (renderAs === 'codelist') {
			cell.push('<span class="ls-country-chip">' + AppI18N.clT(raw, field.codelist) + '</span>');
		} else if (renderAs === 'bool-switch') {
			let isYes = (raw === true || raw == '1' || raw == 'Y' || String(raw).toLowerCase() === 'true') ? 'Yes' : 'No';		  
			cell.push('<span class="ls-badge">' + isYes + '</span>');
		} else if (renderAs === 'count') {
			cell.push('<span style="font-weight:600; color:var(--md-text-secondary);">' + String(typeof raw === 'number' ? raw : 0) + '</span>');
		  
		} else if (renderAs === 'date') {
			let dateStr = '-'
			if (raw) {
				try {
				  var d   = new Date(raw);
				  dateStr = d.toLocaleDateString('en-GB', { day:'2-digit', month:'short', year:'numeric' });				  
				} catch(e) { dateStr = String(raw); }				
			}
			cell.push('<span class="ls-cell-text">' + dateStr + '</span>');
			  
		} else {
			var s = (raw === '' || raw === null || raw === undefined) ? '—' : String(raw);
			cell.push('<span class="ls-cell-text" title="'+s+'">' + s + '</span>');		
		}
		return cell.join('');
	}

	function _badgeClass(flVal, flMd) {
		
		if (code === '' || code === null || code === undefined) return 'no';
		var s  = String(code).toLowerCase();
		var lp = (path || '').toLowerCase();
		if (lp.indexOf('priority') >= 0 || lp.indexOf('casepriority') >= 0) {
		  if (s === '1' || s === 'high')   return 'priority-1';
		  if (s === '2' || s === 'medium') return 'priority-2';
		  return 'priority-3';
		}
		if (lp.indexOf('reporttype') >= 0) {
		  var rmap = {'1':'report-1','2':'report-2','3':'report-3','4':'report-4'};
		  return rmap[s] || 'no';
		}
		var statusMap = {
		  'submitted':'priority-3', 'active':'priority-3', 'sent':'priority-3',
		  'acknowledged':'priority-3', 'completed':'priority-3',
		  'pending':'priority-2', 'draft':'no',
		  'overdue':'priority-1', 'failed':'priority-1'
		};
		if (statusMap[s]) return statusMap[s];
		if (lp.indexOf('authority') >= 0) return 'report-1';
		return 'no';
	}
  
	function _renderGridBody(isLookup){
		let gridRecs = [];
		let pageIndex = 0;
		let pageLimit = 25;
		let md = null;
		if(isLookup){
			gridRecs = _lkpFilterRecs;
			pageIndex = _lkpPageIndex;
			pageLimit = _lkpPageLimit;
			md = _lkpMetadata;
		} else {
			gridRecs = _filterRecs;
			pageIndex = _pageIndex;
			pageLimit = _pageLimit;
			md = _metadata;
		}
		let tb = [];
		
		let pageInd = pageIndex;
		let totalPages  = Math.max(1, Math.ceil(gridRecs.length / pageLimit));
		if (pageInd > totalPages) pageInd = totalPages;

		var start   = pageInd * pageLimit;
		var pageRecs = gridRecs.slice(start, start + pageLimit);
		var gridFields = md.GRID_FIELDS || [];

		
		if (gridRecs.length === 0) {
		  tb.push(`
			<tr>
			  <td colspan=${gridFields.length + 1}>
				<div class="ls-empty-state">
				  <svg viewBox="0 0 24 24"><path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/></svg>
				  <p> ${AppI18N.t('listing.noRecords')}</p>
				</div>
			  </td>
			</tr>
		  `);
		  return tb.join('');
		} else {
			for (let rec of pageRecs) {
				tb.push('<tr class="ls-data-rec" id="'+rec.id+'">');
				
				//More action col
				tb.push('  <td style="text-align:center; white-space:nowrap;">');
				if(!isLookup){
					tb.push(' 	<button class="ls-btn-edit">');
					tb.push('  	  <svg viewBox="0 0 24 24" style="width:12px;height:12px;stroke:currentColor;fill:none;stroke-width:2;stroke-linecap:round;">' +
									'<path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7"/>' +
									'<path d="M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z"/>' +
								  '</svg>');
					tb.push(AppI18N.t('common.edit'));
					tb.push('  	</button>');
				} else {
					tb.push(`<input class="ls-row-chk" type="checkbox" ${_lkpSelRecs[rec.id] ? 'checked' : ''}>`);
				}
				tb.push('  </td>');
				
				//Grid fields
				for (let f of gridFields) {
					tb.push(`<td style="text-align:left; overflow:hidden;text-overflow:ellipsis;white-space:nowrap">`);
					tb.push(_renderCell(f, rec));
					tb.push('</td>');
				}
				
				tb.push('</tr>');			
			}
		}

		return tb.join('')
	}
	
	
	
	function _pageRange(total, current) {
		if (total <= 7) {
		  var arr = [];
		  for (var i = 1; i <= total; i++) arr.push(i);
		  return arr;
		}
		var pages = [1];
		if (current > 3)              pages.push('…');
		for (var p = Math.max(2, current - 1); p <= Math.min(total - 1, current + 1); p++) pages.push(p);
		if (current < total - 2)      pages.push('…');
		pages.push(total);
		return pages;
	}
	  
	function _renderPaginationbar(isLookup) {
		let dataList = [];
		let pageInd = 0;
		let pageSize = 25;
		if(isLookup){
			dataList = _lkpFilterRecs;
			pageInd = _lkpPageIndex + 1;
			pageSize = _lkpPageLimit;
		} else {
			dataList = _filterRecs;
			pageInd = _pageIndex + 1;
			pageSize = _pageLimit;
		}
		let pg = [];
		
		var total     = dataList.length;
		var totalPages = Math.max(1, Math.ceil(total / pageSize));
		if (pageInd > totalPages) pageInd = totalPages;

		var start = (pageInd - 1) * pageSize + 1;
		var end   = Math.min(pageInd * pageSize, total);
		let prevBtnInd = pageInd == 1 ? 0 : (pageInd-1);
		let lastBtnInd = pageInd == pageSize ? pageSize : (pageInd + 1);

		/* Left: record range info */
		var info = total === 0
		  ? '0 ' + AppI18N.t('listing.records')
		  : start + '–' + end + ' of ' + total + ' ' + (total !== 1 ? AppI18N.t('listing.records') : AppI18N.t('listing.record'));
		pg.push('<span class="ls-pg-info">' + info + '</span>');

		/*spacer*/
		let pageOptions = [10,25,50];
		pg.push('<div style="flex:1"></div>');	

		/* Page size selector */
		pg.push('<span class="ls-pg-size-label">' + AppI18N.t('listing.rows') + '</span>');
		pg.push('<select class="ls-pg-size-select">');
		for(let s of pageOptions){
			pg.push('  <option value="'+s+'" '+ (s == pageSize ? 'selected' : '') +'>'+s+'</option>');
		}
		
		pg.push('</select>')

		
		/* Prev button */
		pg.push('<button class="ls-pg-btn" index="'+prevBtnInd+'"  '+(pageInd == 1 ? 'disabled':'')+'>');
		pg.push('  <svg viewBox="0 0 24 24" style="width:13px;height:13px;stroke:currentColor;fill:none;stroke-width:2.5;stroke-linecap:round;stroke-linejoin:round;">' +
					'<polyline points="15 18 9 12 15 6"/>'
				 +'</svg>');
		pg.push('</button>');
		
		/* Page number pills */
		var pages = _pageRange(totalPages, pageInd);
		for (var pi = 0; pi < pages.length; pi++) {
			let btnTxt = pages[pi];	
			pg.push('<button class="ls-pg-btn" index="'+pages[pi]+'" '+(pageInd == btnTxt ? 'disabled':'')+'>'+btnTxt+'</button>');			
		}

		/* Next button */
		pg.push('<button class="ls-pg-btn" index="'+lastBtnInd+'" '+(pageInd >= totalPages ? 'disabled':'')+'>');
		pg.push('  <svg viewBox="0 0 24 24" style="width:13px;height:13px;stroke:currentColor;fill:none;stroke-width:2.5;stroke-linecap:round;stroke-linejoin:round;">' +
					'<polyline points="9 18 15 12 9 6"/>'
					+'</svg>');
		pg.push('</button>');
		return pg.join('');
	}
  
	function performPagination(pageBtn){
		let pageInd = parseInt(pageBtn.getAttribute('index'));
		if(isNaN(pageInd)){
			return;
		}
		let isLookup = $('.lookup-container').has(pageBtn)[0];
		let isClientModel = false;
		
		
		if(isLookup){
			_lkpPageIndex = pageInd-1;					
			isClientModel = !_lkpMetadata.dataModel || _lkpMetadata.dataModel === 'client';
		} else {
			_pageIndex = pageInd-1;
			isClientModel = !_metadata.dataModel || _metadata.dataModel === 'client';
		}
		
		if(isClientModel){
			_renderListingGridBody(isLookup);
		} else {
			fetchListingRecords(isLookup);
		}
		
	}
	function _renderListingGridBody(isLookup){
		let bgHtml = _renderGridBody(isLookup);
		if(isLookup){
			$('.lookup-container .listing-recs-body').html(bgHtml);
		} else {
			$('.listing-container .listing-recs-body').html(bgHtml);
		}
		
		
		let pagerHtml = _renderPaginationbar(isLookup);
		if(isLookup){
			$('.lookup-container .ls-pagination-bar').html(pagerHtml);
		} else {
			$('.listing-container .ls-pagination-bar').html(pagerHtml);
		}
	}
	
	function applySorting(colCmp){
		let fieldId = colCmp.getAttribute('fieldId');
		if(!fieldId){
			return;
		}
		let isLookup = $('.lookup-container').has(colCmp)[0];
		let isClientModel = false;
		if(isLookup){
			if(_lkpSortField == fieldId){
				_lkpSortDir = _lkpSortDir === 'ASC' ? 'DESC' : 'ASC';
			} else {
				_lkpSortField = fieldId;
				_lkpSortDir = 'ASC';
			}			
			$('.lookup-container .sorted').removeClass('sorted');
			$(colCmp).addClass('sorted');
			isClientModel = !_lkpMetadata.dataModel || _lkpMetadata.dataModel === 'client';
		} else {
			if(_sortField == fieldId){
				_sortDir = _sortDir === 'ASC' ? 'DESC' : 'ASC';
			} else {
				_sortField = fieldId;
				_sortDir = 'ASC';
			}
			//sorted
			$('.listing-container .sorted').removeClass('sorted');
			$(colCmp).addClass('sorted');
			isClientModel = !_metadata.dataModel || _metadata.dataModel === 'client';
		}
		
		if(isClientModel){
			performClientModelSort(isLookup);
		} else {
			fetchListingRecords(isLookup);
		}
	}
	
	function performClientModelSort(isLookup){
		let flCtx = '';
		let sortFl = null;
		let dir = 'ASC'
		if(isLookup){
			sortFl = _lkpMetadata.gridFields.find(f=>f.fieldId === _sortField);
			dir = _lkpSortDir;
		}else {
			sortFl = _metadata.gridFields.find(f=>f.fieldId === _sortField);
			dir = _sortDir;
		}
		
		if(!sortFl || !sortFl.fieldPath){
			return;
		}
		flCtx = sortFl.fieldPath;
		_filterRecs.sort((o1, o2)=>{
			let cmpRes = 0;
			if(!o1[flCtx]){
				cmpRes = -1;
			}else if(!o2[flCtx]){
				cmpRes = 1;
			} else {
				cmpRes = o1[flCtx].localeCompare(o2[flCtx]);
			}
			return dir === 'ASC' ? cmpRes : -cmpRes;
		});
		_renderListingGridBody(isLookup);
	}
	
	
	function clearListingFilters(cmp){
		let isLookup = $('.lookup-container').has(cmp)[0] ? true : false;
		if(isLookup){
			_lkpCriterias = [];
			$('.lookup-container .ls-filter-panel').html(_renderFilters(_lkpMetadata, _lkpModuleId));
		} else {
			_listCriterias = [];
			$('.listing-container .ls-filter-panel').html(_renderFilters(_metadata, _moduleId));
		}
		
		fetchListingRecords(isLookup);		
	}
	
	
	function filterFieldsChangeEvent(fieldCmp){
		let isLookup = $('.lookup-container .ls-filter-panel').has(fieldCmp)[0] ? true : false;
		
		let fieldId = fieldCmp.getAttribute('fieldId');
		if(!fieldId){
			return;
		}
		
		let criteriaList = [];
		if(isLookup){
			criteriaList = _lkpCriterias;
		} else {
			criteriaList = _listCriterias;
		}
		
		let existingCondd = criteriaList.filter(c=>c.fieldId === fieldId)[0];
		if(existingCondd){
			if(existingCondd.value === fieldCmp.value){
				return;
			}
			if(!fieldCmp.value){
				const index = criteriaList.findIndex(c => c.fieldId === fieldId);
				if (index !== -1) {
				  _listCriterias.splice(index, 1);
				}
			}
			existingCondd.value = fieldCmp.value;
		} else if(fieldCmp.value){
			criteriaList.push({fieldId:fieldId, value:fieldCmp.value});
		}
		
		fetchListingRecords(isLookup);
	}	
	
	async function fetchListingRecords(isLookup){
		let moduleId = isLookup ? _lkpModuleId : _moduleId;
		let md = isLookup ? _lkpMetadata : _metadata;
		if(!moduleId || !md){
			return [];
		}
		
		var gridFields = (md && md.GRID_FIELDS) || [];
		var listingColumns = gridFields.filter(function(f) { return f.fieldId; }).map(function(f) { return f.fieldId; });

		/* Client model: fetch all records in one shot (max 10000), filter/sort client-side.
		 Server model: server handles paging — use real page params (future). */
		var dataModel = (md && md.dataModel) || 'client';
		var criteria = isLookup ? 
		{
			listingColumns: listingColumns,
			conditions:     _lkpCriterias,
			sortFieldId:    _lkpSortField,
			sortDirection:  _lkpSortDir,
			startIndex:     _lkpPageIndex,
			recordsPerPage: dataModel === 'client' ? 10000 : _lkpPageLimit
		} : {
			listingColumns: listingColumns,
			conditions:     _listCriterias,
			sortFieldId:    _sortField,
			sortDirection:  _sortDir,
			startIndex:     _pageIndex,
			recordsPerPage: dataModel === 'client' ? 10000 : _pageLimit
		};
		
		
		//Filter badge icon handler
		if(isLookup){
			$('.module-lookup .filter-badge').text(_lkpCriterias.length);
			if(_lkpCriterias.length > 0){
				$('.module-lookup .filter-badge').show();			
			} else {
				$('.module-lookup .filter-badge').hide();
			}
		} else {
			$('.content-view .filter-badge').text(_listCriterias.length);
			if(_listCriterias.length > 0){
				$('.content-view .filter-badge').show();			
			} else {
				$('.content-view .filter-badge').hide();
			}
		}
		
		//load the module data records		
		let fetchResponse = await AppAPI.fetchListingRecs(moduleId, criteria);
		if(isLookup){
			_lkpDataRecs = fetchResponse.records;
			_lkpFilterRecs = _lkpDataRecs;
			_lkpTotRecs = fetchResponse.totalRecords;
		} else {
			_dataRecs = fetchResponse.records;
			_filterRecs = _dataRecs;
			_totRecs = fetchResponse.totalRecords;
		}
		
		_renderListingGridBody(isLookup);
		
	}
	
	function _renderGridPanel(md, moduleId, isLookup){
		let panelHtml = [];
		
		panelHtml.push('<div class="ls-grid-panel">');
		
		//Toolbar
		panelHtml.push('	<div class="ls-grid-toolbar">');
			//Title Wrap
		panelHtml.push('		<div style="display:flex; align-items:center; gap:8px; min-width:0;">');
				//title el
		panelHtml.push('			<span style="font-size:14px; font-weight:700; color:var(--md-text-primary); white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">');
		panelHtml.push(					md.title || 'Listing');
		panelHtml.push('			</span>');
		
				//moduleTag
		panelHtml.push('			<span style="font-size:10px; color:var(--md-text-hint); background:var(--md-bg);padding:2px 7px; border-radius:4px; border:1px solid var(--md-border);white-space:nowrap; flex-shrink:0;">');
		panelHtml.push(					md.module || '');
		panelHtml.push('			</span>');
		
		panelHtml.push('		</div>');
		
				//spacer
		panelHtml.push('		<div style="flex:1"></div>');
				//New button
		if(!isLookup){
		panelHtml.push('		<button class="ls-btn-new">');
		panelHtml.push('			<svg viewBox="0 0 24 24" style="width:14px;height:14px;stroke:white;fill:none;stroke-width:2.5;stroke-linecap:round;">');
		panelHtml.push('				<line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/>');
		panelHtml.push('			</svg>' + AppI18N.t('common.new'));
		panelHtml.push('		</button>');
				//More option wrap
		panelHtml.push(`		<div class="menu-wrapper" style="position:relative;"/>
									<button class="ls-btn-more menu-btn-cmp" title="More Actions">
										<svg viewBox="0 0 24 24" style="width:15px;height:15px;fill:var(--md-text-secondary);">
										  <circle cx="5"  cy="12" r="1.5"/>
										  <circle cx="12" cy="12" r="1.5"/>
										  <circle cx="19" cy="12" r="1.5"/>
										</svg>
									</button>
									<div class="md-dropdown__menu" style="display:none;">
										<div class="md-dropdown__menu__item">${AppI18N.t('listing.export')}</div>
									</div>
								</div>`);
		}
		
		panelHtml.push('	</div>');
				
		/* ── Table wrap ──────────────────────────────────────────────── */
		panelHtml.push('	<div class="ls-table-wrap">');
		panelHtml.push('		<table class="ls-table">');
		
		//Grid Headers
		panelHtml.push('		  <thead>');
		panelHtml.push('			<tr>');
		panelHtml.push('				<th style="width:'+(isLookup ? '32px' : '72px')+'; text-align:center;">' + (isLookup ? '<input class="ls-row-chk-all" type="checkbox">' : AppI18N.t('listing.colActions')) + '</th>');
		
		for(let col of (md.GRID_FIELDS || [])){
			panelHtml.push(`			<th fieldId="${col.fieldId}" class="ls-table-field" style="width:${col.columnWidth || '30ch'}; text-align:left;cursor:${col.allowSorting ? 'pointer':''}">${AppI18N.mT(col.label, moduleId)}<span class="${col.allowSorting ? 'ls-sort-icon' : ''}" > &#8597;</th>`);
		}
		panelHtml.push('			</tr>');
		panelHtml.push('		  </thead>');
		
		//Grid Body
		panelHtml.push('		  <tbody class="listing-recs-body"></tbody>');
		
		panelHtml.push('		</table>');
		panelHtml.push('	</div>');
    

		/* ── Pagination bar ──────────────────────────────────────────── */
		panelHtml.push('	<div class="ls-pagination-bar"></div>');
		
		panelHtml.push('</div>');
		
		return panelHtml.join('')
	}
	
	function _renderFilters(meta, currModuleId){
		var fields = meta.FILTERS_FIELDS || [];
		
		if(fields.length == 0){
			return '';
		}
		
		let filterHtml = [];
		
		
		//header
		filterHtml.push('	<div class="ls-filter-header">');
		filterHtml.push('		<span class="ls-filter-title"><svg viewBox="0 0 24 24" style="width:13px;height:13px;stroke:currentColor;fill:none;' +
		  'stroke-width:2;stroke-linecap:round;flex-shrink:0;"><path d="M3 4h18M7 8h10M10 12h4"/></svg>'+ AppI18N.t('listing.filters', currModuleId)+'<span class="filter-badge ls-badge ls-badge-top" style="display:none;">0</span></span>');
		
		//Clear button
		filterHtml.push('		<button class="ls-filter-clear">' + AppI18N.t('listing.clearAll') + '</button>');
		
		filterHtml.push('	</div>');
		
		//Filter panel body
		filterHtml.push('	<div class="ls-filter-body">');
		
		
		for (var i = 0; i < fields.length; i++) {
			filterHtml.push(renderFilterFields(fields[i], currModuleId));
		}
		
		filterHtml.push('	</div>');
		
		
		return filterHtml.join('');
	
	}
	
	function _buildListingGridContainer(md, moduleId, isLookup){
		let panelHtml = [];
		
		panelHtml.push('<div style="display:flex; flex:1; min-height:0; overflow:hidden;">');
		
		panelHtml.push('<div class="ls-filter-panel">');
		panelHtml.push(_renderFilters(md, moduleId));
		panelHtml.push('</div>');
		
		panelHtml.push(_renderGridPanel(md, moduleId, isLookup));
		
		panelHtml.push('</div>');
		
		return panelHtml.join('');
	}
	
	async function renderListingScreen(lookupModuleId){
		//load the module specific metadata
		console.log('Rendering Listing screen...');
		
		//'content-view' target panel	
		
		let item = AppMenuHeader.activeModule();
		_moduleId = item.moduleId;
		_showContentLoading('Loading ' + (item && item.label ? item.label : _moduleId) + '…');

		let listingMeta = await AppMD.listing(_moduleId);
		_metadata = listingMeta;
		
		
		let listHtml = [];
		listHtml.push('<div class="listing-container" style="flex:1; display:flex; flex-direction:column; min-height:0; overflow:hidden;">');
		
		
		if(_metadata){
			_dataRecs = [];
			_filterRecs = [];
			_totRecs = 0;
			_pageIndex = 0;
			_sortField = null;
			_sortDir = 'ASC';
			_listCriterias = [];
			
			//Build Widgets
			let widgetHtml = _buildWidgets(_metadata);
			listHtml.push(widgetHtml);
			
			//Build Listing page grid container
			let listPanel = _buildListingGridContainer(_metadata, _moduleId, false);
			listHtml.push(listPanel);
			listHtml.push('</div>');
			$('#content-view').html(listHtml.join(''));
			
			//Load the grid records
			fetchListingRecords(false);
		} else {
			listHtml.push(`<div style="padding:40px;text-align:center;color:var(--md-text-secondary);font-size:14px;">
				No listing configuration found for module: <strong> ${item.label} </strong>.</div>
			`);
			listHtml.push('</div>');
			$('#content-view').html(listHtml.join(''));
		}
	}
	
	async function renderLookupScreen(moduleId, callBackFun){
		//load the module specific metadata
		console.log('Rendering Listing screen...');
		
		//'content-view' target panel	
		
		let listingMeta = await AppMD.lookup(moduleId);
		if(!listingMeta){
			MDUtils.toast('Error loading metadata', 'error', 'Validations')
			return;
		}
		_lkpModuleId = moduleId;
		_lkpMetadata = listingMeta;
		_lkpDataRecs = [];		
		_lkpSelRecs = [];
		_lkpTotRecs = 0;
		_lkpFilterRecs = [];	
		_lkpPageIndex = 0;
		_lkpSortField = null;
		_lkpSortDir = 'ASC';
		_lkpCriterias = [];
		_lkpCallBack = callBackFun;
		
		let listHtml = [];
				
		//Build Listing page grid container
		let listPanel = _buildListingGridContainer(_lkpMetadata, _lkpModuleId, true);
		listHtml.push(listPanel);
		$('.lookup-view .lookup-container').html(listHtml.join(''));
		
		
		//Load the grid records
		fetchListingRecords(true);
		
		$('.module-lookup').show();
	}
	
	global.AppListScreen = {
		listing:		renderListingScreen,
		lookup:			renderLookupScreen,
		filter:			filterFieldsChangeEvent,
		clearFilter:	clearListingFilters,
		pageSize: 		setListingPageSize,
		sort:			applySorting,
		pagination:		performPagination,
		selectRec:		selectLookupRow,
		select:			selectLookupRecords
	}
})(window);




/* ══════════════════════════════════════════════════════════════════
     EXPORT  — CSV and Excel (XLSX-flavoured HTML table)
  ══════════════════════════════════════════════════════════════════ */
  function _exportRows() {
    /* Use filtered full set (all pages), not just current page */
    var gridFields = _meta.GRID_FIELDS || [];
    var rows = [gridFields.map(function(f) { return f.label; })];
    _filtered.forEach(function(rec) {
      rows.push(gridFields.map(function(f) {
        var raw = _getVal(rec, f.fieldPath);
        if (f.renderAs === 'badge' || f.renderAs === 'codelist') {
          return f.codelist ? _decode(f.codelist, raw) : String(raw || '');
        }
        if (f.renderAs === 'date' && raw) {
          try { return new Date(raw).toLocaleDateString('en-GB', { day:'2-digit', month:'short', year:'numeric' }); }
          catch(e) { return String(raw); }
        }
        return raw === null || raw === undefined ? '' : String(raw);
      }));
    });
    return rows;
  }

  function _exportCSV() {
    var rows = _exportRows();
    var csv  = rows.map(function(row) {
      return row.map(function(cell) {
        var s = String(cell).replace(/"/g, '""');
        return (s.indexOf(',') >= 0 || s.indexOf('"') >= 0 || s.indexOf('\n') >= 0) ? '"' + s + '"' : s;
      }).join(',');
    }).join('\r\n');

    var blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    _download(blob, (_meta.title || 'export') + '.csv');
  }

  function _exportExcel() {
    /* Produce an HTML table wrapped in the Excel XML namespace — opens
       natively in Excel with no library dependency.                    */
    var rows   = _exportRows();
    var table  = '<table><thead><tr>' +
      rows[0].map(function(h) { return '<th>' + _esc(h) + '</th>'; }).join('') +
      '</tr></thead><tbody>' +
      rows.slice(1).map(function(row) {
        return '<tr>' + row.map(function(c) { return '<td>' + _esc(String(c)) + '</td>'; }).join('') + '</tr>';
      }).join('') +
      '</tbody></table>';

    var xls =
      '<html xmlns:o="urn:schemas-microsoft-com:office:office" ' +
      'xmlns:x="urn:schemas-microsoft-com:office:excel" ' +
      'xmlns="http://www.w3.org/TR/REC-html40">' +
      '<head><meta charset="UTF-8"/>' +
      '<!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets>' +
      '<x:ExcelWorksheet><x:Name>' + _esc(_meta.title || 'Export') + '</x:Name>' +
      '<x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions>' +
      '</x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->' +
      '</head><body>' + table + '</body></html>';

    var blob = new Blob([xls], { type: 'application/vnd.ms-excel;charset=utf-8;' });
    _download(blob, (_meta.title || 'export') + '.xls');
  }

  function _download(blob, filename) {
    var url = URL.createObjectURL(blob);
    var a   = document.createElement('a');
    a.href  = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    setTimeout(function() { URL.revokeObjectURL(url); a.remove(); }, 200);
  }
  
  /* ══════════════════════════════════════════════════════════════════
     UTILS
  ══════════════════════════════════════════════════════════════════ */
  function _esc(s) {
    return String(s || '')
      .replace(/&/g, '&amp;').replace(/</g, '&lt;')
      .replace(/>/g, '&gt;').replace(/"/g, '&quot;');
  }
