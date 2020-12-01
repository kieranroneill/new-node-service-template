import { Application } from 'express';
import { agent } from 'supertest';

// Enums.
import { ApiRoutes } from '../../enums';

// Helpers.
import { setupServer } from '../../../test/helpers';

interface Scope {
  app: Application;
}

describe(ApiRoutes.HealthCheck, () => {
  let scope: Scope;

  beforeEach(async () => {
    const { app } = await setupServer();

    scope = {
      app,
    };
  });

  describe(`GET ${ApiRoutes.HealthCheck}`, () => {
    it('should return a 200', async () => {
      await agent(scope.app).get(ApiRoutes.HealthCheck).expect(200);
    });
  });
});
