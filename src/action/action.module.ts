import { Module } from '@nestjs/common';
import { ActionService } from './action.service';
import { ActionController } from './action.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  providers: [ActionService],
  controllers: [ActionController],
  imports: [PrismaModule],
})
export class ActionModule {}
