import { BucketsResponseInterface } from "../viewmodel/BucketsResponseInterface";
import { LoginResponseInterface } from "../viewmodel/LoginResponseInterface";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";

export interface ControllerPhotosInterface {

  /**
   * 第一次加载数据
   * */
  onLoad(): Promise<PhotosItemInterface[]>;

  /**
   *
   * 加载更多数据
   *
   * */
  onNextLoad(): Promise<PhotosItemInterface[]>;

  loadImage2Local(url: string): Promise<ArrayBuffer>;

}