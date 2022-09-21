import { io } from 'socket.io-client';

class SocketioService {
  socket;
  constructor() {}

  setupSocketConnection() {
    this.socket = io('http://ec2-3-93-179-92.compute-1.amazonaws.com:3100', {query: {
      token: 'BACKENDCLIENTSOCKET'
    }});
    this.socket.emit('my message', 'Hello there from Vuexxx.');
    this.socket.emit('my message', 'Hello there from Vue123.');
    this.socket.emit('eventsApiBackend', {event: 'data1', data: {race:'lol',ticket:'test'}});
    
  }
  subcribers() {
    this.socket.on('data1', (data) => {
      console.log('data1 jajaja');
      console.log(data);
    });
    this.socket.on('my message', (data) => {
      console.log('data1 jajaja');
      console.log(data);
    });
  }
  
  disconnect() {
    if(this.socket) {
      this.socket.disconnect();
    }
  }
}

export default new SocketioService();