import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  UseGuards,
} from '@nestjs/common';
import { AssignService } from './assign.service';
import { IAssignDTO, IRemoveAssignDTO } from './dto/assign.dto';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';

@Controller('assign')
export class AssignController {
  constructor(private readonly assignService: AssignService) {}

  @UseGuards(JwtAuthGuard)
  @Get(':userId')
  async getCompaniesAssignedToUser(@Param('userId') userId: string) {
    return await this.assignService.getCompaniesAssignedToUser(Number(userId));
  }

  @UseGuards(JwtAuthGuard)
  @Post()
  async assignUserToACompany(@Body() data: IAssignDTO) {
    return await this.assignService.assignUserToACompany(data);
  }

  @UseGuards(JwtAuthGuard)
  @Delete()
  async removeAssignUserToACompany(@Body() data: IRemoveAssignDTO) {
    return await this.assignService.removeAssignUserToACompany(data);
  }
}
