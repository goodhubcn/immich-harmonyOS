export interface PhotosItemInterface {
  city: string;
  country: string;
  duration: string;
  id: string;
  visibility: string;
  isFavorite: boolean;
  isImage: boolean;
  isTrashed: boolean;
  livePhotoVideoId: string;
  fileCreatedAt: string;
  localOffsetHours: number;
  ownerId: string;
  projectionType: string;
  ratio: number;
  status: string;
  thumbhash: string;

  assetUrl: string;

  // demo: http://192.168.1.50:8086/api/assets/ddf3ea35-e336-4915-ba18-cf60c0919c35/thumbnail?size=thumbnail&c=%2FPcFAgCgipZoiYh3cGUGTHU%3D
  // assetUrl(): string;
}