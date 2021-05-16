const {io} = require('../index');

io.on('connection', client => {
    console.log('Cliente conectado');
  //client.on('event', data => { /* … */ });
  client.on('disconnect', () => { /* … */ });

  client.on('mensaje', (payload) => {
      console.log(payload);
      io.emit('mensaje', {resp: 'resouestaaa'});
  })

  client.on('emitir-mensaje', (payload) => {
    console.log('Enviando mensaje');
    io.emit('nuevo-mensaje', 'mensaje recibido?');
  });
});
