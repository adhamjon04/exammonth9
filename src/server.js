const express = require('express');
const app = express();
const cors = require('cors');
const { PORT } = require('./config');

//middelwares
app.use(cors());
app.use(express.json());
app.use(require('./modules'));

app.listen(PORT, console.log('server is running on ' + PORT));
