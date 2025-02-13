import { Module } from '@nestjs/common';
import { AssignController } from './assign.controller';
import { AssignService } from './assign.service';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  controllers: [AssignController],
  providers: [AssignService],
  imports: [PrismaModule],
})
export class AssignModule {}
