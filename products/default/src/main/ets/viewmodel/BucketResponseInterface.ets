
export interface BucketResponseInterface {
  city: Array<string>;
  country: Array<string>;
  duration: Array<string>;
  id: Array<string>;
  visibility: Array<string>;
  isFavorite: Array<boolean>;
  isImage: Array<boolean>; // Array indicating whether each asset is an image (false for videos)
  isTrashed: Array<boolean>; //Array indicating whether each asset is in the trash
  livePhotoVideoId: Array<string>;
  fileCreatedAt: Array<string>;
  localOffsetHours: Array<number>; //Array of UTC offset hours at the time each photo was taken. Positive values are east of UTC, negative values are west of UTC. Values may be fractional (e.g., 5.5 for +05:30, -9.75 for -09:45). Applying this offset to 'fileCreatedAt' will give you the time the photo was taken from the photographer's perspective.
  ownerId: Array<string>;
  projectionType: Array<string>;
  ratio: Array<number>; // Array of aspect ratios (width/height) for each asset
  status: Array<string>;
  thumbhash: Array<string>;
}