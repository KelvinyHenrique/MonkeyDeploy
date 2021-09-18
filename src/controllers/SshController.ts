import { Request, Response } from 'express';
import SSHService from '../Services/ssh/SshService';

export default class SshController {
  static async command(req: Request, res: Response) {
    try {
      const { body } = req;
      const { command, directory, params } = body;
      const ssh = await SSHService.command(command, params, directory);
      res.json(ssh);
    } catch (error) {
      res.status(500).json({ error });
    }
  }
}
