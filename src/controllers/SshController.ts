import { Request, Response } from 'express';
import SshService from '../Services/ssh/SshService';

export default class SshController {
  static async command(req: Request, res: Response) {
    try {
      const { body } = req;
      const { command, directory, params } = body;
      const sshservice = new SshService(
        process.env.SSH_HOST,
        process.env.SSH_PORT,
        process.env.SSH_USER,
        process.env.SSH_PRIVATE_KEY,
      );

      const ssh = await sshservice.command(command, params, directory);
      res.json(ssh);
    } catch (error) {
      res.status(500).json({ error });
    }
  }
}
