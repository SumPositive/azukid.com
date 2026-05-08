function applyFontScaleFromQuery() {
  try {
    // アプリから渡された文字サイズ指定をCSS属性へ反映する。
    var params = new URLSearchParams(window.location.search);
    var scale = params.get('fontScale');
    if (scale === 'standard' || scale === 'large' || scale === 'xLarge') {
      document.documentElement.setAttribute('data-font-scale', scale);
    }
  } catch (e) {}
}

applyFontScaleFromQuery();

function toggleTheme() {
  var h = document.documentElement;
  var cur = h.getAttribute('data-theme');
  var sys = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  var isDark = cur ? cur === 'dark' : sys === 'dark';
  var next = isDark ? 'light' : 'dark';
  h.setAttribute('data-theme', next);
  localStorage.setItem('theme', next);
}
