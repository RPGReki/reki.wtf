var d = document,
    b = d.querySelectorAll('#body')[0],
    bc = b.classList,
    l = localStorage;

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms))
}

function isHasAcceptedPolicy() {
  return (l.getItem('acceptedPolicy'))
}

function getCookie() {
  return d.cookie
}

function writeCookie(n, v, t = 14) {
  var dt = new Date();
  dt.setTime(dt.getTime() + t * 24 * 3600 * 1000);
  d.cookie = n + '=' + v + '; expires=' + dt.toUTCString() + '; ' + 'domain=' + window.location.hostname
+ '; path=/'
}

function toggleTheme() {
  bc.toggle('dark-theme');
  bc.toggle('light-theme');

  bc.contains('light-theme')?l.setItem('lightTheme', 1):l.removeItem('lightTheme')
}

function toggleDyslexicFont() {
  bc.toggle('dyslexic');

  bc.contains('dyslexic')?l.setItem('dyslexic', 1):l.removeItem('dyslexic')
}

function toggleTextVide() {
  bc.toggle('vide');
  loadTextVide();

  bc.contains('vide')?l.setItem('vide', 1):l.removeItem('vide')
}

async function loadTextVide() {
  var js, fjs = d.getElementsByTagName('script')[0];
  var i = 'text-vide';

  if (d.getElementById(i)) {
    return;
  }
  
  js = d.createElement('script');
  js.id = i;
  js.src = '/assets/2021/scripts/text-vide/text-vide.min.js';

  fjs.parentNode.insertBefore(js, fjs);

  while ('undefined' == typeof textVide) {
    await sleep(100)
  }
  h = d.getElementById('mobile-top');
  h.innerHTML=textVide(h.innerHTML, {sep: ['<span class="vide-focus">', '</span>']}).replaceAll(/&<span class="vide-focus">([a-zA-Z0-9]*)<\/span>([a-zA-Z0-9]*);/g, "&$1$2;");
  m = d.getElementById('content');
  m.innerHTML=textVide(m.innerHTML, {sep: ['<span class="vide-focus">', '</span>']}).replaceAll(/&<span class="vide-focus">([a-zA-Z0-9]*)<\/span>([a-zA-Z0-9]*);/g, "&$1$2;")
}

function restoreSettings() {
  if (!isHasAcceptedPolicy()) {
    d.querySelectorAll('.policy-banner')[0].style.display = 'block';
    return;
  }
  d.querySelectorAll('.controls')[0].style.display = 'flex';
  
  if (l.getItem('lightTheme')) {
    d.querySelectorAll('#dark-mode')[0].checked=true;
    toggleTheme()
  };
  if (l.getItem('dyslexic')) {
    d.querySelectorAll('#dyslexic')[0].checked=true;
    toggleDyslexicFont()
  }
  if (l.getItem('vide')) {
    d.querySelectorAll('#vide')[0].checked=true;
    toggleTextVide()
  }
}

restoreSettings();
if('serviceWorker' in navigator)navigator.serviceWorker.register('/worker.js');
