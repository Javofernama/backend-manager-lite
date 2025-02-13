import {
  BadRequestException,
  Body,
  Controller,
  Get,
  NotImplementedException,
  Post,
} from '@nestjs/common';
import { UserAuthDto } from 'src/auth/dto/auth.dto';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Get('')
  async workingInProgress() {
    throw new NotImplementedException();
  }

  @Post('')
  async authUserLogin(@Body() data: UserAuthDto) {
    const validLogin = await this.authService.authUserLogin(data);

    if (!validLogin) throw new BadRequestException('Email or Pass Incorrect');

    return validLogin;
  }
}
