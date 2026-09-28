// 文字サイズは端末・ブラウザの設定に従う（iOS は style.css で端末の文字サイズに連動）。
// 以前のサイト内の文字サイズ選択で保存した値は使わないので片付ける。
// アプリから渡される ?fontScale= も、古い版のアプリが送ってくるだけなので読まない
try { localStorage.removeItem('fontScale'); } catch (e) {}

function toggleTheme() {
  var h = document.documentElement;
  var cur = h.getAttribute('data-theme');
  var sys = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  var isDark = cur ? cur === 'dark' : sys === 'dark';
  var next = isDark ? 'light' : 'dark';
  h.setAttribute('data-theme', next);
  localStorage.setItem('theme', next);
}
