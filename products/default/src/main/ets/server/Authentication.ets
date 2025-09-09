import { LoginResponseInterface } from "../viewmodel/LoginResponseInterface";

export interface Authentication {
  //
  // https://v1.137.1.archive.immich.app/docs/api/get-auth-status
  //
  /**
   * POST /auth/admin-sign-up
   * curl -L '/api/auth/admin-sign-up' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   --data-raw '{
   "email": "testuser@email.com",
   "name": "Admin",
   "password": "password"
   }'
   * @param {string} username - The username of the user.
   * @param {string} password - The password of the user.
   * @returns {Promise<void>} A promise that resolves when the sign-in is successful.
   */
  signUpAdmin: (username: string, password: string) => Promise<void>;

  /**
   * POST /auth/change-password
   * curl -L '/api/auth/change-password' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "newPassword": "password",
   "password": "password"
   }'
   * @param username
   * @param oldPassword
   * @param newPassword
   * @returns
   */
  changePassword: (username: string, oldPassword: string, newPassword: string) => Promise<void>;

  /**
   * POST /auth/login
   * curl -L '/api/auth/login' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   --data-raw '{
   "email": "testuser@email.com",
   "password": "password"
   }'
   *
   *
   * {
   "accessToken": "EXZZaoi1kTJHpYgEiGGFQ0J5OyWX2QV3n6WS9DZiH0",
   "userId": "f09d89c8-24f2-4d94-9120-ed8a83204ef3",
   "userEmail": "m.jackie@aliyun.com",
   "name": "immich-test",
   "isAdmin": false,
   "profileImagePath": "",
   "shouldChangePassword": false,
   "isOnboarded": true
   }
   * */
  login: (email: string, password: string) => Promise<LoginResponseInterface>;

  /**
   *
   * POST /auth/logout
   *
   * curl -L -X POST '/api/auth/logout' \
   -H 'Accept: application/json'
   *
   *
   * */
  logout: () => Promise<void>;

  /**
   * DELETE /auth/pin-code
   *
   * curl -L -X DELETE '/api/auth/pin-code' \
   -H 'Content-Type: application/json' \
   -d '{
   "password": "string",
   "pinCode": "123456"
   }'
   * */
   resetPinCode: (password: string, pinCode: string) => Promise<void>;

  /**
   * POST /auth/pin-code
   *
   * curl -L '/api/auth/pin-code' \
   -H 'Content-Type: application/json' \
   -d '{
   "pinCode": "123456"
   }'
   * */
  setupPinCode: (pinCode: string) => Promise<void>;

  /**
   * PUT /auth/pin-code
   * curl -L -X PUT '/api/auth/pin-code' \
   -H 'Content-Type: application/json' \
   -d '{
   "newPinCode": "123456",
   "password": "string",
   "pinCode": "123456"
   }'
   * */
  changePinCode: (newPinCode: string, password: string, pinCode: string) => Promise<void>;

  /**
   * POST /auth/session/lock
   *
   * curl -L -X POST '/api/auth/session/lock'
   *
   * */
  lockAuthSession: () => Promise<void>;


  /**
   * POST /auth/session/unlock
   *
   * curl -L '/api/auth/session/unlock' \
   -H 'Content-Type: application/json' \
   -d '{
   "password": "string",
   "pinCode": "123456"
   }'
   * */
  unlockAuthSession: (password: string, pinCode: string) => Promise<void>;

  /**
   * GET /auth/status
   *
   * curl -L '/api/auth/status' \
   -H 'Accept: application/json'
   * */
  getAuthStatus: () => Promise<void>;


  /**
   * POST /auth/validateToken
   *
   * curl -L -X POST '/api/auth/validateToken' \
   -H 'Accept: application/json'
   *
   * */
  validateAccessToken: () => Promise<void>;


}