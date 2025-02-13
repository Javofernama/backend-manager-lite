import { Injectable } from '@nestjs/common';
import { UserAuthDto } from 'src/auth/dto/auth.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(
    private readonly prisma: PrismaService,
    private jwtService: JwtService,
  ) {}
  async authUserLogin(data: UserAuthDto): Promise<object> {
    const user = await this.prisma.user.findFirst({
      where: { userEmail: data.userEmail },
    });

    if (!user) return;

    const isPasswordValid = await bcrypt.compare(data.userPass, user.userPass);

    if (!isPasswordValid) return;

    const { userId, userName, userLastName, userEmail, userStatus } = user;

    return {
      code: 200,
      access_token: this.jwtService.sign({
        userId,
        userName,
        userLastName,
        userEmail,
        userStatus,
      }),
    };
  }
}
