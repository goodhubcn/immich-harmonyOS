import { LoginResponseInterface } from "../viewmodel/LoginResponseInterface";

export interface ControllerUserInterface {
  login(email: string, password: string): Promise<LoginResponseInterface>;
}