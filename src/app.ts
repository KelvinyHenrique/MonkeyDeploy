import express from 'express';
import dotenv from 'dotenv';

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(require('./routes'));

dotenv.config();

const port = process.env.PORT || 8031;
app.listen(port, () => {
  console.info(`Listening on http://monkeydeploy.duckdns.org:${port}`);
});
