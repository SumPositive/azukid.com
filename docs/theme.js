function toggleTheme() {
  var h = document.documentElement;
  var cur = h.getAttribute('data-theme');
  var sys = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  var isDark = cur ? cur === 'dark' : sys === 'dark';
  var next = isDark ? 'light' : 'dark';
  h.setAttribute('data-theme', next);
  localStorage.setItem('theme', next);
}
