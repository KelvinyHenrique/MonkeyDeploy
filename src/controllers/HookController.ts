import { Request, Response } from 'express';
import HookService from '../Services/Hook/HookService';

export default class HookController {
  static async github(req: Request, res: Response) {
    try {
      const user = new HookService();
      const { body } = req;
      const response = await user.github(body);
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }
}
