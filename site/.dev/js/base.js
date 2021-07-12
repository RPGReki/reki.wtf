var x, y = null;

function loadYouTube(e = null) {
  if (e == null) return;
  var i = e.target.getAttribute('data-videoid');
  d.getElementById(i).innerHTML = d.getElementById('yt-' + i).innerHTML
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

function clearCookies() {
  writeCookie('acceptedPolicy', '', -1);
  writeCookie('fontSize', '', -1);
  writeCookie('darkTheme', '', -1);
  writeCookie('dyslexic', '', -1)
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms))
}

async function acceptPolicy() {
  var banner = d.querySelectorAll('#policy-banner')[0];
  banner.style.opacity = 0;
  writeCookie('acceptedPolicy', true);
  await sleep(1000);
  banner.style = null
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
  $('#tts').on('change', toggleTTS);
  $('.youtube a:last-child').on('click', loadYouTube);

  d.addEventListener('beforeprint', ()=>{
    $('img').prop('loading','eager')
  })
}

function toggleAccordion(e) {
  e.classList.toggle('inactive');
  e.classList.toggle('active')
}

function toggleAllAccordions() {
  d.querySelectorAll('.inactive')
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
  js.src = '/assets/2021/scripts/talkify/talkify.min.js';

  fjs.parentNode.insertBefore(js, fjs)
}

async function createTTS() {
  t = d.createElement('div');
  t.style = 'display:none';
  t.id = 'tts-content';

  b.append(t);

  t = $('#tts-content');

  t.append($('body > header').html());

  if(pageType=='chapter') t.append($('.volume-title')[0].outerHTML);

  t.append(
    $('main h1')[0].outerHTML,
    $('#talkify-metadata').html(),
    $('main section').html()
  );

  $('#tts-content [aria-label]').each((e,i) => {i.innerHTML = i.getAttribute('aria-label')});
  $('#tts-content .navbar-collpase').remove();
  $('#tts-content [aria-hidden]').remove();
  $('#tts-content button').remove();
  $('#tts-content [role=doc-noteref]').remove();

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
  if (b.lang == "de-DE") {
    player.forceVoice(voices.find(e => e.lang.match(/DE/)));
    player.forceVoice(voices.find(e => e.name.match(/Microsoft Katja Online|Google Deutsch/)))
  } else {
    player.forceVoice(voices.find(e => e.lang.match(/CA|US/)));
    player.forceVoice(voices.find(e => e.name.match(/Microsoft Guy Online|Google US/)))
  }

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

setUpPageForUsers()
