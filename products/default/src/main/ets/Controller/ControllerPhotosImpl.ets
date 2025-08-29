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

}