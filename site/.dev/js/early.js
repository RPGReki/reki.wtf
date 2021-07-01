var d = document;
var b = d.querySelectorAll('#body')[0];
var bc = b.classList;

function getCookie() {
  return d.cookie
}

function isHasAcceptedPolicy() {
  return (null != getCookie().match(/acceptedPolicy=true/))
}

function writeCookie(cookieName, cookieValue, ttl = 14) {
  var date = new Date();
  date.setTime(date.getTime() + ttl * 24 * 3600 * 1000);
  d.cookie = cookieName + '=' + cookieValue + '; expires=' + date.toUTCString() + '; ' + 'domain=' + window.location.hostname
+ '; path=/'
}

function toggleTheme() {
  bc.toggle('dark-theme');
  bc.toggle('light-theme');

  writeCookie('darkTheme', c.contains('dark-theme'))
}

function toggleDyslexicFont() {
  bc.toggle('dyslexic');

  writeCookie('dyslexic', c.contains('dyslexic'))
}

function zoom(points) {
  var fontSize = (parseInt(b.style.fontSize, 10) || 12) + points;
  if (fontSize > 22) fontSize = 24;
  if (fontSize < 10) fontSize = 8;
  b.style.fontSize = fontSize + 'pt';
  writeCookie('fontSize', fontSize)
}

function restoreSettingsFromCookie() {
  if (!isHasAcceptedPolicy()) {
    var b = d.querySelectorAll('.policy-banner')[0];
    b.style.display = 'block';
    return;
  }

  if (null != getCookie().match(/darkTheme=false/)) {
    d.querySelectorAll('#dark-mode').checked=true;
    toggleTheme()
  }
  if (null != getCookie().match(/dyslexic=true/)) {
    d.querySelectorAll('#dyslexic').checked=true;
    toggleDyslexicFont()
  }
  if (null != getCookie().match(/fontSize/))
    zoom((getCookie().match(/(^| )fontSize=([^;]+)/))[2] - 12);
  acceptPolicy()
}

restoreSettingsFromCookie()