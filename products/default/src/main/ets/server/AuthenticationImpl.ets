import { LoginResponseInterface } from "../viewmodel/LoginResponseInterface";
import { Authentication } from "./Authentication";
import { rcp } from "@kit.RemoteCommunicationKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { RCPUtils } from "../network/RCPUtils";

export class AuthenticationImpl implements Authentication {

  rcputils: RCPUtils|undefined = undefined;
  constructor(utils: RCPUtils) {
    this.rcputils = utils;
  }

  async signUpAdmin(username: string, password: string): Promise<void> {
    // TODO
  }

  async changePassword(username: string, oldPassword: string, newPassword: string): Promise<void> {
    // TODO
  }
  async login(email: string, password: string): Promise<LoginResponseInterface> {

    let loginResponse: LoginResponseInterface = {
      accessToken: '',
      userId: '',
      userEmail: '',
      name: '',
      isAdmin: false,
      profileImagePath: '',
      shouldChangePassword: false,
      isOnboarded: false
    };
    let requestContent: rcp.RequestContent = {
      "email": email,
      "password": password
    }
    await this.rcputils?.rcpSession().post(this.rcputils.baseUrl() + '/api/auth/login', requestContent).then((response) => {

      loginResponse = response.toJSON() as LoginResponseInterface;

    }).catch((err: BusinessError) => {
      console.error(`err: err code is ${err.code}, err message is ${JSON.stringify(err)}`);
    });
    return loginResponse;
	}

  async logout(): Promise<void> {
    // TODO
  }
  async resetPinCode(password: string, pinCode: string): Promise<void> {
    // TODO
  }
  async setupPinCode(pinCode: string): Promise<void> {
    // TODO
  }
  async changePinCode(newPinCode: string, password: string, pinCode: string): Promise<void> {
    // TODO
  }
  async lockAuthSession(): Promise<void> {
    // TODO
  }
  async unlockAuthSession(password: string, pinCode: string): Promise<void> {
    // TODO
  }
  async getAuthStatus(): Promise<void> {
    // TODO
  }
  async validateAccessToken(): Promise<void> {
    // TODO
  }

}