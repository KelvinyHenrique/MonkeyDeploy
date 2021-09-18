import { NodeSSH } from 'node-ssh';
/* import Mongo from '../../database/mongo'; */
import Pg from '../../database/postgres';

export default class SSHService {
  static async command(comand: string, params: Array<string>, directory: string) {
    const pg = new Pg();
    pg.query('fgdsg');
    /*  mongo.listDatabases(); */
    try {
      const ssh = new NodeSSH();
      await ssh.connect({
        host: '192.168.2.215', // dotenv nor working here
        port: 22,
        username: 'kelviny',
        privateKey: './id_rsa',
      });

      const response = await ssh.exec(comand, params, { cwd: directory });
      return { message: 'Comando executado com sucesso', retorno: response };
    } catch (error) {
      return { error: 1, message: 'Error in connect into server', fullError: error };
    }
  }
}
