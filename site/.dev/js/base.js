var x, y = null;

function loadYouTube(e = null) {
  if (e == null) return;
  var i = e.target.getAttribute('data-videoid') || e.currentTarget.getAttribute('data-videoid');
  console.log(i);
  d.getElementById(i).innerHTML = d.getElementById('yt-' + i).innerHTML
}

function clearCookies() {
  writeCookie('acceptedPolicy', '', -1);
  writeCookie('fontSize', '', -1);
  writeCookie('darkTheme', '', -1);
  writeCookie('dyslexic', '', -1);
  l.clear()
}

async function acceptPolicy() {
  var banner = d.querySelectorAll('#policy-banner')[0];
  banner.style.opacity = 0;
  l.setItem('acceptedPolicy', true);
  await sleep(1000);
  banner.style = null
}

async function setUpPageForUsers() {
  await sleep(500);

  d.getElementsByTagName('html')[0].className = 'animated';
  $('#dark-mode').on('change', toggleTheme);
  $('#dyslexic').on('change', toggleDyslexicFont);
  $('#vide').on('change', toggleTextVide);
  $('#tts').on('change', toggleTTS);
  $('.youtube a:first-child').on('click', loadYouTube);
  $('.youtube a:nth-child(2)').on('click', loadYouTube);
  
  d.addEventListener('beforeprint', ()=>{
    $('img').prop('loading','eager')
  });

  d.addEventListener('copy', (e)=>{
    const s = d.getSelection(), t = d.createElement('div'),sl=$('[rel=shortlink]')[0],l=(sl?sl.href:d.URL);
    for(var i=0; i < s.rangeCount;++i) t.appendChild(s.getRangeAt(i).cloneContents());
    e.clipboardData.setData('text/plain', s +'\n\n' + $('#copyright p')[0].innerText + '\n' + l);
    e.clipboardData.setData('text/html', '<link rel="canonical" href="' + l + '">' + t.innerHTML + '<p style="text-align:right">' + $('#copyright p')[0].innerHTML + '<br><a href="' + l + '" rel="canonical">' + l + '</a></p>');
    e.preventDefault()
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

  if (d.getElementById(i))
    return;
  
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

  t.append($('body .navbar-brand').html());

  if(pageType=='chapter') t.append($('.volume-title')[0].outerHTML);

  t.append(
    $('main h1')[0].outerHTML,
    $('#talkify-metadata')[0].outerHTML,
    $('main section').html()
  );

  $('#tts-content [aria-label]').each((e,i) => {i.outerHTML=i.getAttribute('aria-label')});
  $('#tts-content .navbar-collpase').remove();
  $('#tts-content script').remove();
  $('#tts-content link').remove();
  $('#tts-content [aria-hidden]').remove();
  $('#tts-content button').remove();
  $('#tts-content [role=doc-noteref]').remove();
  $('#tts-content .vide-focus').each((e,i) => {i.outerHTML=i.innerHTML});

  window['ttsContent'] = $('#tts-content').toArray()
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

  var r=0;
  var html5p=('speechSynthesis' in window);
  while(html5p && 0 == (window['voices'] = window.speechSynthesis.getVoices()).length){
    await sleep(100);
    if (r++>10)
      html5p = false
  }
  
  if(html5p){
    window['player'] = new talkify.Html5Player();
    if (b.lang == "de-DE") {
      player.forceVoice(voices.find(e => e.lang.match(/DE/)));
      player.forceVoice(voices.find(e => e.name.match(/Microsoft Katja Online|Google Deutsch/)))
    } else {
      player.forceVoice(voices.find(e => e.lang.match(/CA|US/)));
      player.forceVoice(voices.find(e => e.name.match(/Microsoft Guy Online|Google US/)))
    }
  } else {
    $('.tts-controls').html('<div class="btn btn-lg btn-danger">Text to Speech could not be initialized.</div>');
    return
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
  
    while ('undefined' == typeof playlist || 'undefined' == typeof ttsContent)
      await sleep(10);

    playlist.play();
    return
  }

  if (isReading)
    player.pause();
  else
    player.play();

  isReading=!isReading
}


setUpPageForUsers()
