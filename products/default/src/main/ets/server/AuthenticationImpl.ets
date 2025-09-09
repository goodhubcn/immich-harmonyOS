import { LoginResponseInterface } from "../viewmodel/LoginResponseInterface";
import { Authentication } from "./Authentication";
import { rcp } from "@kit.RemoteCommunicationKit";
import { BusinessError } from "@kit.BasicServicesKit";

export class AuthenticationImpl implements Authentication {

  baseUrl: string = ''; //AppStorage.get<string>('serverUrl') as string;

  rcpSession: rcp.Session;

  constructor(url: string) {
    this.baseUrl = url;
    this.rcpSession = rcp.createSession();
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
    await this.rcpSession.post(this.baseUrl + '/api/auth/login', requestContent).then((response) => {

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