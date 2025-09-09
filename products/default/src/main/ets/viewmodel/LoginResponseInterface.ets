
/**
 *
 * {
 "accessToken": "hANTMGPwOMNPR7hrab5EL6QxHy7VDkCSDBBOlvV9FVo",
 "userId": "f09d89c8-24f2-4d94-9120-ed8a83204ef3",
 "userEmail": "m.jackie@aliyun.com",
 "name": "immich-test",
 "isAdmin": false,
 "profileImagePath": "",
 "shouldChangePassword": false,
 "isOnboarded": true
 }
 *
 * */
export interface LoginResponseInterface {
  accessToken: string;
  userId: string;
  userEmail: string;
  name: string;
  isAdmin: boolean;
  profileImagePath: string;
  shouldChangePassword: boolean;
  isOnboarded: boolean;
}