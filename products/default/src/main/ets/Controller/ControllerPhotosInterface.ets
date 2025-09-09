import { LoginResponseInterface } from "../viewmodel/LoginResponseInterface";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";

export interface ControllerPhotosInterface {

  /**
   * 第一次加载数据
   * */
  onLoad: () => Promise<PhotosItemInterface[]>;

  /**
   *
   * 加载更多数据
   *
   * */
  onNextLoad: () => Promise<PhotosItemInterface[]>;

  login: (email: string, password: string) => Promise<LoginResponseInterface>;

}