// const HandleBar = require('handlebar.js')


function LeaderboardTrackingSubscription() {

  const WEBSOCKET_HOST = 'ws://localhost:3000/cable';

  socket = new WebSocket(WEBSOCKET_HOST);

  socket.onopen = function(event) {
    console.log('WebSocket is connected.');
    const msg = {
      command: 'subscribe',
      identifier: JSON.stringify({
        channel: 'AppearanceChannel'
      }),
    };
    socket.send(JSON.stringify(msg));
  };

  socket.onclose = function(event) {
    console.log('WebSocket is closed.');
  };

  socket.onmessage = function(event) {
    saveData(event.data)
  };

}

function saveData(data) {
  data = JSON.parse(data)
  if(data && data.message && data.message.leaderboard) {
    localStorage.setItem('cars', JSON.stringify(data.message.leaderboard));
    renderDom();
  }
}

function renderDom() {
  var cars = JSON.parse(localStorage.getItem('cars'));
  var template = Handlebars.compile(
    "{{#each cars}}<tr> <td>{{this.position}}</td> <td><span class='badge' style='background: {{this.car_color}};'>{{this.car_number}}</span></td> <td>{{this.driver_name}}</td> <td>{{this.last_lap}}</td> </tr>{{/each}}"
    )
  render(template({ cars: cars }));
}

function render(template) {
  var node = document.getElementsByClassName('table-data')[0];
  node.innerHTML = template;
};
