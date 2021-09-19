import express from 'express';
import dotenv from 'dotenv';

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(require('./Routes'));

dotenv.config();

const port = process.env.APP_PORT;
app.listen(port, () => {
  console.info(`Listening on http://monkeydeploy.duckdns.org:${port}`);
});
