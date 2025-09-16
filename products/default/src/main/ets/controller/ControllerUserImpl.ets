import { RCPUtils } from "../network/RCPUtils";
import { Authentication } from "../server/Authentication";
import { AuthenticationImpl } from "../server/AuthenticationImpl";
import { LoginResponseInterface } from "../viewmodel/LoginResponseInterface";
import { ControllerUserInterface } from "./ControllerUserInterface";

export class ControllerUserImpl implements ControllerUserInterface {


  async login(email: string, pass: string): Promise<LoginResponseInterface> {

    console.log(`ControllerPhotosImpl login with email: ${email} and password: ${pass}`);

    let authentication: Authentication = new AuthenticationImpl(RCPUtils.getInstance());

    let resp: LoginResponseInterface = {
      accessToken: "",
      userId: "",
      userEmail: "",
      name: "",
      isAdmin: false,
      profileImagePath: "",
      shouldChangePassword: false,
      isOnboarded: false
    };

    await authentication.login(email, pass).then((response) => {
      resp = response;
      console.log(`Login response: ${JSON.stringify(response)}`);

      if (response.accessToken) {
        // 保存登录信息到本地存储
        AppStorage.setOrCreate('accessToken', response.accessToken);
        AppStorage.setOrCreate('userId', response.userId);
        AppStorage.setOrCreate('userEmail', response.userEmail);
        AppStorage.setOrCreate('userName', response.name);
        AppStorage.setOrCreate('isAdmin', response.isAdmin);
        AppStorage.setOrCreate('profileImagePath', response.profileImagePath);
        AppStorage.setOrCreate('isOnboarded', response.isOnboarded);

      } else {
        console.error('Login failed: No access token received');
      }

    }).catch((error: Error) => {
      throw error;
    });

    return resp;
  }

}