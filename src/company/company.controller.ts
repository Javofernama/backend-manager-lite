import {
  Controller,
  Get,
  NotFoundException,
  Param,
  UseGuards,
} from '@nestjs/common';
import { CompanyService } from './company.service';
import { Company } from '@prisma/client';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';

@Controller('company')
export class CompanyController {
  constructor(private readonly companyService: CompanyService) {}

  @UseGuards(JwtAuthGuard)
  @Get()
  async getAllCompanies(): Promise<Partial<Company>[]> {
    return this.companyService.getAllCompanies();
  }

  @UseGuards(JwtAuthGuard)
  @Get(':id')
  async getCompanyById(@Param('id') id: string): Promise<Partial<Company>> {
    const companyFound = await this.companyService.getCompanyById(Number(id));
    if (!companyFound) throw new NotFoundException('Company not found');
    return companyFound;
  }
}
