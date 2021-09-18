/* eslint-disable import/no-unresolved  */
/* eslint-disable no-unused-vars */
import { NextFunction, Request, Response } from 'express';
// eslint-disable-next-line
import SSHService from '../service/ssh/index';

export default class SSH {
  static async test(req: Request, res: Response, next: NextFunction) {
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
