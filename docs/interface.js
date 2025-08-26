// Minimal frontend to read bridge_log.json (CORS permitting) and POST messages
const LOG_URL = '/bridge_log.json';
const API_URL = '/api/holy-gral-bridge/message';

async function loadLog(){
  try{
    const res = await fetch(LOG_URL);
    const text = await res.text();
    const chat = document.getElementById('chat');
    chat.innerHTML = '';
    const lines = text.trim().split('\n').filter(Boolean);
    lines.forEach(l=>{
      try{
        const e = JSON.parse(l);
        const p = document.createElement('div');
        p.innerHTML = `<strong>${e.from}</strong>: ${e.message} <small style="opacity:.6">(${e.timestamp})</small>`;
        chat.appendChild(p);
      }catch(err){}
    });
  }catch(e){
    document.getElementById('chat').textContent = 'Bridge log not available.';
  }
}

async function sendMessage(){
  const from = document.getElementById('name').value || 'Anonymous';
  const message = document.getElementById('message').value || '';
  if(!message) return alert('Please offer a message.');
  const payload = {
    from_: from,
    to: 'Euystacio',
    message,
    timestamp: new Date().toISOString(),
    signature: '✍️'
  };
  try{
    const res = await fetch(API_URL, {
      method:'POST',
      headers:{'Content-Type':'application/json'},
      body: JSON.stringify(payload)
    });
    if(res.ok){
      document.getElementById('message').value='';
      await loadLog();
    }else{
      alert('Failed to send message');
    }
  }catch(e){
    alert('Error sending message: '+e);
  }
}

document.getElementById('send').addEventListener('click', sendMessage);
loadLog();
// simple polling to reduce load (every 5s)
setInterval(loadLog, 5000);