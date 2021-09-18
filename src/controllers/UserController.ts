import { Request, Response } from 'express';
import UserService from '../Services/user/UserService';

export default class UserController {
  static async create(req: Request, res: Response) {
    try {
      const user = new UserService();
      const { body } = req;
      const response = await user.create(body);
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }

  static async find(req: Request, res: Response) {
    try {
      const { userId } = req.query;
      const user = new UserService();
      const response = await user.find(userId);
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }

  static async findAll(req: Request, res: Response) {
    try {
      const user = new UserService();
      const response = await user.findAll();
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }

  static async update(req: Request, res: Response) {
    try {
      const { body } = req;
      if (body.data && body.where) {
        const user = new UserService();
        const response = await user.update(body.where, body.data);
        res.json(response);
      } else {
        const response = { error: 1, errorCode: 2, message: 'Parâmetros enviados inválidos' };
        res.json(response);
      }
    } catch (error) {
      res.status(500).json({ error });
    }
  }

  static async delete(req: Request, res: Response) {
    try {
      const { userId } = req.query;

      const user = new UserService();
      const response = await user.delete(userId);
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }
}
