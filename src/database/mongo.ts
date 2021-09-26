import { MongoClient } from 'mongodb';

export default class Mongo {
  uri: string;

  client: MongoClient;

  constructor() {
    this.uri = `mongodb+srv://${process.env.DB_USER}:${process.env.DB_PASSWORD}@cluster0.fhhgj.mongodb.net/myFirstDatabase?retryWrites=true&w=majority`;
    this.client = new MongoClient(this.uri);
  }

  async main() {
    try {
      return await this.client.connect();
    } catch (err) {
      return err;
    } finally {
      await this.client.close();
    }
  }

  async listDatabases() {
    let databasesList: any;

    try {
      await this.client.connect();
      databasesList = await this.client.db().admin().listDatabases();
      return databasesList.databases;
    } catch (err) {
      return err;
    } finally {
      await this.client.close();
    }
  }
}
