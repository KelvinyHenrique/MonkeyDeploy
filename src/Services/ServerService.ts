import { PrismaClient } from '@prisma/client';

export default class ServerService {
  prisma: any;

  constructor() {
    this.prisma = new PrismaClient();
  }

  async create(server: any) {
    try {
      const response = await this.prisma.server.create({
        data: server,
      });
      return response;
    } catch (error) {
      console.log(error);
      return { error: 1, fullError: error };
    }
  }

  async find(serverId: any) {
    try {
      const response = await this.prisma.server.findUnique({
        where: {
          server_id: parseInt(serverId, 10),
        },
      });
      return response;
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }

  async findAll() {
    try {
      const response = await this.prisma.server.findMany();
      return response;
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }

  async update(where: any, data: any) {
    try {
      const response = await this.prisma.server.update({
        where,
        data,
      });
      return response;
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }

  async delete(serverId: any) {
    try {
      const response = await this.prisma.server.delete({
        where: { server_id: parseInt(serverId, 36) },
      });
      return response;
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }
}
