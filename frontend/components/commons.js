/* ══ LOADING HELPERS ════════════════════════════════════════════════
   Show/hide a full-content-view skeleton while API calls resolve.
════════════════════════════════════════════════════════════════════ */
function _showContentLoading(message) {
  var cv = document.getElementById('content-view');
  cv.innerHTML =
    '<div style="flex:1;display:flex;align-items:center;justify-content:center;flex-direction:column;gap:14px;color:var(--md-text-secondary);">' +
      '<div class="md-spinner"></div>' +
      '<span style="font-size:13px;">' + (message || (typeof AppI18n !== 'undefined' ? AppI18n.t('common.loading') : 'Loading…')) + '</span>' +
    '</div>';
}

function _showContentError(msg) {
  var cv = document.getElementById('content-view');
  cv.innerHTML =
    '<div style="flex:1;display:flex;align-items:center;justify-content:center;padding:40px;">' +
      '<div style="text-align:center;color:var(--md-text-secondary);max-width:360px;">' +
        '<svg viewBox="0 0 24 24" style="width:36px;height:36px;stroke:var(--md-border-dark);fill:none;stroke-width:1.5;margin-bottom:12px;">' +
          '<path d="M12 9v4m0 4h.01M10.29 3.86L1.82 18a2 2 0 001.71 3h16.94a2 2 0 001.71-3L13.71 3.86a2 2 0 00-3.42 0z"/>' +
        '</svg>' +
        '<p style="font-size:13.5px;line-height:1.6;">' + _esc(msg) + '</p>' +
      '</div>' +
    '</div>';
}

function _esc(s) {
  return String(s || '').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
}
