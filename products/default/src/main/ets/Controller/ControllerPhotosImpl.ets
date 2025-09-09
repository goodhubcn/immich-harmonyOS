import { LoginResponseInterface } from "../viewmodel/LoginResponseInterface";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";
import { ControllerPhotosInterface } from "./ControllerPhotosInterface";

export class ControllerPhotosImpl implements ControllerPhotosInterface {

  async onLoad(): Promise<PhotosItemInterface[]> {
    console.log("ControllerPhotosImpl onLoad");
    return [];
  }

  async onNextLoad(): Promise<PhotosItemInterface[]> {
    console.log("ControllerPhotosImpl onNextLoad");
    return [];
  }

  async login(email: string, password: string): Promise<LoginResponseInterface> {
    console.log(`ControllerPhotosImpl login with email: ${email} and password: ${password}`);

    return {
      accessToken: '',
      userId: '',
      userEmail: '',
      name: '',
      isAdmin: false,
      profileImagePath: '',
      shouldChangePassword: false,
      isOnboarded: false
    };
  }

}