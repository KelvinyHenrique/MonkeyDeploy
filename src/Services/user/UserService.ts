import { PrismaClient } from '@prisma/client';

export default class UserService {
  prisma: any;

  constructor() {
    this.prisma = new PrismaClient();
  }

  async create(user: any) {
    try {
      const response = await this.prisma.user.create({
        data: user,
      });
      return response;
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }

  async find(userId: any) {
    try {
      const response = await this.prisma.user.findUnique({
        where: {
          userId: parseInt(userId, 10),
        },
      });
      return response;
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }

  async findAll() {
    try {
      const response = await this.prisma.user.findMany();
      return response;
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }

  async update(where: any, data: any) {
    try {
      const response = await this.prisma.user.update({
        where,
        data,
      });
      return response;
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }

  async delete(userId: any) {
    try {
      const response = await this.prisma.user.delete({
        where: { userId: parseInt(userId, 36) },
      });
      return response;
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }
}
