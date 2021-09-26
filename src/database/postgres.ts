import { Pool } from 'pg';

export default class Pg {
  client: Pool;

  constructor() {
    const port = 5432;
    this.client = new Pool({
      user: process.env.DB_USERNAME_PGSQL,
      host: process.env.DB_HOST_PGSQL,
      database: process.env.DB_DATABASE_PGSQL,
      password: process.env.DB_PASSWORD_PGSQL,
      port,
    });
  }

  async query(command: string) {
    const clientConnected = await this.client.connect();
    try {
      const response = await clientConnected.query(command);
      return {
        error: 0,
        message: 'query executada com sucesso',
        data: response.rows,
        rowCount: response.rowCount,
      };
    } catch (err) {
      return {
        error: 1,
        errorCode: 'PG001',
        message: 'Ocorreu um erro ao executar a query',
        fullError: err,
      };
    } finally {
      clientConnected.release();
    }
  }
}
