var x, y = null;
var d = document;
var b = $('body');

function getCookie() {
  return d.cookie
}

function isHasAcceptedPolicy() {
  return (null != getCookie().match(/acceptedPolicy=true/))
}

async function acceptPolicy() {
  var banner = $('#policy-banner')[0];
  banner.style.opacity = 0;
  writeCookie('acceptedPolicy', true);
  await sleep(1000);
  banner.style = null
}


function writeCookie(cookieName, cookieValue, ttl = 14) {
  var date = new Date();
  date.setTime(date.getTime() + ttl * 24 * 3600 * 1000);
  d.cookie = cookieName + '=' + cookieValue + '; expires=' + date.toUTCString() + '; ' + 'domain=' + window.location.hostname
+ '; path=/'
}


function toggleTheme() {
  if (!isHasAcceptedPolicy()) {
    return
  }

  b.toggleClass('dark-theme').toggleClass('light-theme');
  writeCookie('darkTheme', b.hasClass('dark-theme'))
}

function toggleDyslexicFont() {
  if (!isHasAcceptedPolicy()) {
    return
  }

  b.toggleClass('dyslexic');
  writeCookie('dyslexic', b.hasClass('dyslexic'))
}


function loadYouTube() {
  var videos = d.getElementsByClassName('youtube');
  for (var i = 0; i < videos.length; i++) {
    videos[i].innerHTML = d.getElementById(videos[i].getAttribute('data-videoid')).innerHTML
  }
}

function restoreSettingsFromCookie() {
  if (!isHasAcceptedPolicy()) {
    var bannerClass = $('.policy-banner');
    for(var i = 0; i < bannerClass.length; i++)
      bannerClass[i].style.display = 'block'
    return;
  }

  if (null != getCookie().match(/darkTheme=false/)) {
    $('#dark-mode').prop('checked', true);
    toggleTheme()
  }
  if (null != getCookie().match(/dyslexic=true/)) {
    $('#dyslexic').prop('checked', true);
    toggleDyslexicFont()
  }
  if (null != getCookie().match(/fontSize/))
    zoom((getCookie().match(/(^| )fontSize=([^;]+)/))[2] - 12);
  acceptPolicy()
}

function g(evt) {
  return evt.touches
}

function touchStart(evt) {
  const firstTouch = g(evt)[0];
  x = firstTouch.clientX;
  y = firstTouch.clientY
}

function touchMove(evt) {
  if (null == x || null == y)
    return;

  var xu = evt.touches[0].clientX;
  var yu = evt.touches[0].clientY;

  var xd = x - xu;
  var yd = y - yu;

  if (Math.abs(xd) > 11 && Math.abs(xd) > 2 * Math.abs(yd)) {
    if (xd > 0)
      loadPage('next');
    else
      loadPage('previous')
  }

  x = null, y = null
}

function loadPage(partId) {
  var href = $('#' + partId)[0].href;
  if ('' == href) return;

  window.location.href = href
}

function zoom(points) {
  if (!isHasAcceptedPolicy())
    return;

  var fontSize = (parseInt(b.style.fontSize, 10) || 12) + points;
  if (fontSize > 20) fontSize = 22;
  if (fontSize < 12) fontSize = 10;
  b.style.fontSize = fontSize + 'pt';
  writeCookie('fontSize', fontSize)
}

function clearCookies() {
  writeCookie('acceptedPolicy', '', -1);
  writeCookie('fontSize', '', -1);
  writeCookie('darkTheme', '', -1);
  writeCookie('dyslexic', '', -1)
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms))
}

async function setUpPageForUsers() {
  await sleep(200);
  var isMobile = window.matchMedia('only screen and (max-width: 785.9px)').matches;

  if (isMobile) {
    d.addEventListener('touchstart', touchStart, false);
    d.addEventListener('touchmove', touchMove, false);
    toggleAllAccordions()
  }
  
  d.getElementsByTagName('html')[0].className = 'animated';

  $('#dark-mode').on('change', toggleTheme);
  $('#dyslexic').on('change', toggleDyslexicFont);
  $('#tts').on('change', toggleTTS)
}

function toggleAccordion(e) {
  e.classList.toggle('inactive');
  e.classList.toggle('active')
}

function toggleAllAccordions() {
  document
    .querySelectorAll('.inactive')
    .forEach(e => {
      toggleAccordion(e)
    })
}

function loadTalkify() {
  var js, fjs = $('script')[0];
  var i = 'talkify';

  if (d.getElementById(i)) {
    return;
  }
  
  js = d.createElement('script');
  js.id = i;
  js.src = '/assets/2020/scripts/talkify/talkify.min.js';

  fjs.parentNode.insertBefore(js, fjs)
}


async function assignVoices() {
  $('#tts-content [data-character*=mittens]').each((e, i) => {i.setAttribute('data-talkify-pitch', 10)});
}

async function createTTS() {
  t = d.createElement('div');
  t.style = 'display:none';
  t.id = 'tts-content';

  b.append(t);

  t = $('#tts-content');
  t.append(
    $('body > header').html(),
    $('.volume-title')[0].outerHTML,
    $('main h1')[0].outerHTML,
    $('#talkify-metadata').html(),
    $('main section').html()
  );

  $('#tts-content [aria-label]').each((e,i) => {i.innerHTML = i.getAttribute('aria-label')});
  $('#tts-content [aria-hidden]').remove();
  $('#tts-content button').remove();

  assignVoices();
  
  window['ttsContent'] = $('#tts-content > *').toArray()
}

async function setUpTalkify() {
  while ('undefined' == typeof talkify || 'undefined' == typeof talkify.config ) {
    await sleep(100)
  }

  talkify.config.useSsml = true;
  talkify.config.remoteService.active = false;
  talkify.config.keyboardCommands.enabled = false;
  talkify.config.voiceCommands.enabled = false;
  talkify.config.ui.audioControls.enabled = false;
  talkify.messageHub.subscribe('[key]', '*', () => {true});
    
  while (0 == (window['voices'] = window.speechSynthesis.getVoices()).length) await sleep(100);
  
  window['player'] = new talkify.Html5Player();
  player.forceVoice(voices.find(e => e.lang.match(/CA|US/)));
  player.forceVoice(voices.find(e => e.name.match(/Microsoft Guy Online|Google US/)));

  while ('undefined' == typeof ttsContent) await sleep(10);

  window['playlist'] = new talkify.playlist()
    .begin()
    .usingPlayer(window['player'])
    .withElements(window['ttsContent'])
    .build()
}

async function toggleTTS() {
  if ('undefined' == typeof window['isReading']) {
    window['isReading'] = true;
    toggleAllAccordions();
    loadTalkify();
    setUpTalkify();
    createTTS();
  
    while ('undefined' == typeof playlist || 'undefined' == typeof ttsContent) {
      await sleep(100)
    }

    playlist.play();
    return
  }

  if (isReading)
    player.pause();
  else
    player.play();

  isReading = !isReading
}

restoreSettingsFromCookie();
setUpPageForUsers();
