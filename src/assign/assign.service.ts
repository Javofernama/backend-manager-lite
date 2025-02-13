import { Injectable } from '@nestjs/common';
import { IAssignDTO, IRemoveAssignDTO } from './dto/assign.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class AssignService {
  constructor(private prisma: PrismaService) {}

  async getCompaniesAssignedToUser(userId: number) {
    const assignedCompanies = await this.prisma.user.findUnique({
      where: {
        userId: userId,
      },
      select: {
        userName: true,
        userLastName: true,
        Assign: {
          select: {
            assignDate: true,
            Company: {
              select: {
                companyId: true,
                companyName: true,
                companyIndustry: true,
                companyRevenue: true,
                Contact: true,
              },
            },
            Action: true,
          },
        },
      },
    });

    return assignedCompanies;
  }

  async assignUserToACompany(data: IAssignDTO) {
    const { userId, companyId } = data;
    const setAssign = await this.prisma.assign.create({ data: { userId } });
    const assignId = setAssign.assignId;

    return await this.prisma.company.update({
      where: {
        companyId,
      },
      data: {
        assignId,
      },
    });
  }

  async removeAssignUserToACompany(data: IRemoveAssignDTO) {
    const { assignId, companyId } = data;
    await this.prisma.assign.delete({ where: { assignId } });

    return await this.prisma.company.update({
      where: {
        companyId,
      },
      data: {
        assignId: null,
      },
    });
  }
}
