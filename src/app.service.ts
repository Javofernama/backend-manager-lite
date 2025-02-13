import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): object {
    return { code: 200, message: 'Welcome to manager lite', v: 0.1 };
  }
}
