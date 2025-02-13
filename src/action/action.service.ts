import { Injectable } from '@nestjs/common';
import { Action } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ActionService {
  constructor(private prisma: PrismaService) {}

  async getActionById(actionId: number) {
    return await this.prisma.action.findUnique({
      where: { actionId },
    });
  }

  async createAction(data: Action): Promise<Action> {
    return await this.prisma.action.create({
      data,
    });
  }
}
