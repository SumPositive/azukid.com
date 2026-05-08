function applyFontScaleFromQuery() {
  try {
    // アプリから渡された文字サイズ指定を優先し、なければ前回選択を使う。
    var params = new URLSearchParams(window.location.search);
    var scale = params.get('fontScale') || localStorage.getItem('fontScale');
    if (scale === 'standard' || scale === 'large' || scale === 'xLarge') {
      document.documentElement.setAttribute('data-font-scale', scale);
      localStorage.setItem('fontScale', scale);
    }
  } catch (e) {}
}

applyFontScaleFromQuery();

function setupFontScaleSelector() {
  var header = document.querySelector('.site-header-inner');
  var themeButton = document.querySelector('.theme-toggle');
  if (!header || !themeButton || document.querySelector('.font-scale-control')) return;

  var isJapanese = (document.documentElement.lang || '').toLowerCase().indexOf('ja') === 0;
  var labels = isJapanese
    ? { title: '文字サイズ', standard: '標準', large: '大', xLarge: '特大' }
    : { title: 'Font size', standard: 'Standard', large: 'Large', xLarge: 'Extra' };
  var current = document.documentElement.getAttribute('data-font-scale') || 'standard';

  var wrapper = document.createElement('label');
  wrapper.className = 'font-scale-control';
  wrapper.setAttribute('aria-label', labels.title);

  var label = document.createElement('span');
  label.className = 'font-scale-label';
  label.textContent = labels.title;

  var select = document.createElement('select');
  select.className = 'font-scale-select';
  select.name = 'fontScale';
  select.setAttribute('aria-label', labels.title);

  ['standard', 'large', 'xLarge'].forEach(function(value) {
    var option = document.createElement('option');
    option.value = value;
    option.textContent = labels[value];
    select.appendChild(option);
  });
  select.value = current;

  select.addEventListener('change', function() {
    var next = select.value;
    var url = new URL(window.location.href);
    document.documentElement.setAttribute('data-font-scale', next);
    localStorage.setItem('fontScale', next);
    url.searchParams.set('fontScale', next);
    window.history.replaceState(null, '', url.toString());
  });

  wrapper.appendChild(label);
  wrapper.appendChild(select);
  header.insertBefore(wrapper, themeButton);
}

setupFontScaleSelector();

function toggleTheme() {
  var h = document.documentElement;
  var cur = h.getAttribute('data-theme');
  var sys = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  var isDark = cur ? cur === 'dark' : sys === 'dark';
  var next = isDark ? 'light' : 'dark';
  h.setAttribute('data-theme', next);
  localStorage.setItem('theme', next);
}
