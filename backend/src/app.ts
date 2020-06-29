import express from 'express';
import cors from 'cors';

import router from './routes';

const app = express();

app.use(express.json());
app.use(cors());
app.use(router);

app.get('/', (req, res) => {
  return res.json({message: 'hello world'});
});

app.listen(3333, () => console.log("Servidor running in port 3333"));