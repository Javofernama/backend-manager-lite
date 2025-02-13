import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';

export interface IJwtPayload {
  userId: number;
  userEmail: string;
  userName: string;
  userLastName: string;
  userStatus: boolean;
}

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(configService: ConfigService) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(), // Extraer el token del header Authorization
      ignoreExpiration: false, // Rechazar tokens expirados
      secretOrKey: configService.get<string>('JWT_SECRET'), // Clave secreta del .env
    });
  }

  async validate(payload: IJwtPayload) {
    // El payload contiene los datos del token (userId, userEmail, etc.)
    return {
      userId: payload.userId,
      userEmail: payload.userEmail,
      userName: payload.userName,
      userLastName: payload.userLastName,
      userStatus: payload.userStatus,
    };
  }
}
