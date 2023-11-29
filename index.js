const qrcode = require('qrcode-terminal');
const { Client, LocalAuth } = require('whatsapp-web.js');

// create a micro express server that sends message to a number

const client = new Client({
    authStrategy: new LocalAuth()
});

client.on('qr', qr => {
    qrcode.generate(qr, {small: true});
});

client.on('ready', () => {
    console.log('Client is ready!');
});

client.initialize();

client.on('message', message => {
	if(message.body === '!ping') {
		message.reply('pong');
	}
});
 
 
// Import the Express module
const express = require('express');

// Create an instance of the Express application
const app = express();

app.use(express.json()); // for parsing application/json
app.use(express.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

// Create a route to send whatsapp message that recieves message by a dinamic url, for example /send?message=hello&number=553198881111, number is country code +  full phone number
app.get('/send', (req, res) => {
    const message = req.query.message;
    const number = req.query.number;
    client.sendMessage(number + '@c.us', message).then(response => {
        res.send("message sent successfully");
    });
});

// Set the server to listen on port 3000
const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
 