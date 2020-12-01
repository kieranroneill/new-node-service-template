import { createLogger as createWinstonLogger, Logger, transports } from 'winston';

export default function createLogger(
  name: string,
): Logger {
  return createWinstonLogger({
    defaultMeta: {
      service: name,
    },
    exitOnError: false,
    transports: [
      new transports.Console({
        level: 'debug',
        handleExceptions: true,
        json: false,
        colorize: true,
      }),
    ],
  });
}
