import { Request, Response } from 'express';
import HookService from '../Services/Hook/HookService';

export default class HookController {
  static async github(req: Request, res: Response) {
    try {
      const user = new HookService();
      const { body } = req;
      body.eventType = req.headers['x-github-event'] || 'unrecognized';
      const response = user.github(body);
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }
}
