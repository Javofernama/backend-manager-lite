import { Body, Controller, Post, UseGuards } from '@nestjs/common';
import { ActionService } from './action.service';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { Action } from '@prisma/client';

@Controller('action')
export class ActionController {
  constructor(private readonly actionService: ActionService) {}

  @UseGuards(JwtAuthGuard)
  @Post()
  async createAction(@Body() data: Action): Promise<Action> {
    return await this.actionService.createAction(data);
  }
}
