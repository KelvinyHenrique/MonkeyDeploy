import { NodeSSH } from 'node-ssh';

export default class SshService {
  host: string;

  port: number;

  username: string;

  privateKey: string;

  constructor(host: any, port: any, username: any, privateKey: any) {
    this.host = host;
    this.port = port;
    this.username = username;
    this.privateKey = privateKey;
  }

  async command(command: string, params: Array<string>, directory: string) {
    try {
      const ssh = new NodeSSH();
      await ssh.connect({
        host: this.host, // dotenv not working here 🤡
        port: this.port,
        username: this.username,
        privateKey: this.privateKey,
        tryKeyboard: true,
      });
      const response = await ssh.execCommand(command, { cwd: directory });
      return { error: response.code, message: 'Comando executado com sucesso', response };
    } catch (error) {
      console.error(error);
      return { error: 1, message: 'Error in connect into server', fullError: error };
    }
  }
}
