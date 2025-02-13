import { Injectable } from '@nestjs/common';
import { Company } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class CompanyService {
  constructor(private prisma: PrismaService) {}

  async getAllCompanies(): Promise<Partial<Company>[]> {
    return await this.prisma.company.findMany({
      select: {
        companyId: true,
        companyName: true,
        companyAddress: true,
        companyWebsite: true,
        companyIndustry: true,
        companyRevenue: true,
        companyPhone: true,
        Contact: true,
        Assign: {
          select: {
            User: {
              select: {
                userName: true,
                userLastName: true,
                userEmail: true,
              },
            },
            Action: {
              select: {
                actionId: true,
                actionTitle: true,
                actionDescription: true,
                actionDate: true,
                actionType: true,
                actionState: true,
              },
            },
            assignId: true,
          },
        },
      },
    });
  }

  async getCompanyById(companyId: number): Promise<Partial<Company>> {
    return await this.prisma.company.findUnique({
      where: { companyId },
      select: {
        companyId: true,
        companyName: true,
        companyAddress: true,
        companyWebsite: true,
        companyIndustry: true,
        companyRevenue: true,
        companyPhone: true,
        Contact: true,
        Assign: {
          select: {
            User: {
              select: {
                userName: true,
                userLastName: true,
                userEmail: true,
              },
            },
            Action: {
              select: {
                actionId: true,
                actionTitle: true,
                actionDescription: true,
                actionDate: true,
                actionType: true,
                actionState: true,
              },
            },
            assignId: true,
          },
        },
      },
    });
  }
}
