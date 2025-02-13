import { Injectable } from '@nestjs/common';
import { User } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  async hashString(text: string): Promise<string> {
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(text, saltRounds);
    return hashedPassword;
  }

  async getAllUsers(): Promise<Partial<User>[]> {
    return this.prisma.user.findMany({
      select: {
        userId: true,
        userName: true,
        userLastName: true,
        userEmail: true,
        userStatus: true,
      },
    });
  }

  async getUserById(id: number): Promise<Partial<User>> {
    return await this.prisma.user.findUnique({
      where: { userId: id },
      select: {
        userId: true,
        userName: true,
        userLastName: true,
        userEmail: true,
        userStatus: true,
      },
    });
  }

  async createUser(data: User): Promise<User> {
    const hashedPassword = await this.hashString(data.userPass);
    data.userPass = hashedPassword;
    return await this.prisma.user.create({
      data,
    });
  }

  async updateUser(userId: number, data: User): Promise<User> {
    return await this.prisma.user.update({
      where: {
        userId,
      },
      data,
    });
  }

  async deactiveUser(userId: number): Promise<User> {
    const deactive = { userStatus: false };
    return await this.prisma.user.update({
      where: {
        userId,
      },
      data: { ...deactive },
    });
  }
}
