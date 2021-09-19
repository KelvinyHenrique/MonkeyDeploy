import { Request, Response } from 'express';
import ServerService from '../Services/ServerService';

export default class ServerController {
  static async create(req: Request, res: Response) {
    try {
      const server = new ServerService();
      const { body } = req;
      const response = await server.create(body);
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }

  static async find(req: Request, res: Response) {
    try {
      const { serverid } = req.query;
      const server = new ServerService();
      const response = await server.find(serverid);
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }

  static async findAll(req: Request, res: Response) {
    try {
      const server = new ServerService();
      const response = await server.findAll();
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }

  static async update(req: Request, res: Response) {
    try {
      const { body } = req;
      if (body.data && body.where) {
        const server = new ServerService();
        const response = await server.update(body.where, body.data);
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
      /* Teste */
      const { serverid } = req.query;

      const server = new ServerService();
      const response = await server.delete(serverid);
      res.json(response);
    } catch (error) {
      res.status(500).json({ error });
    }
  }
}
