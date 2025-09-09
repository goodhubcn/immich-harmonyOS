import { LoginResponseInterface } from "./LoginResponseInterface";

export class LoginResponseImpl implements LoginResponseInterface {
  accessToken: string = '';
  userId: string = '';
  userEmail: string = '';
  name: string = '';
  isAdmin: boolean = false;
  profileImagePath: string = '';
  shouldChangePassword: boolean = false;
  isOnboarded: boolean = false;

  constructor(
    accessToken: string,
    userId: string,
    userEmail: string,
    name: string,
    isAdmin: boolean,
    profileImagePath: string,
    shouldChangePassword: boolean,
    isOnboarded: boolean
  ) {
    this.accessToken = accessToken;
    this.userId = userId;
    this.userEmail = userEmail;
    this.name = name;
    this.isAdmin = isAdmin;
    this.profileImagePath = profileImagePath;
    this.shouldChangePassword = shouldChangePassword;
    this.isOnboarded = isOnboarded;
  }

}