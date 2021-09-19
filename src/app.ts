import express from 'express';
import dotenv from 'dotenv';

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(require('./Routes'));

dotenv.config();

const port = 8320;
app.listen(port, () => {
  console.log(`Listening on http://localhost:${port}`);
});
