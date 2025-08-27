export interface Duplicates {

  //
  // https://v1.138.0.archive.immich.app/docs/api/delete-assets
  //

  /**
   * DELETE /duplicates
   *
   * curl -L -X DELETE '/api/duplicates' \
   -H 'Content-Type: application/json'
   *
   * Request Body — REQUIRED
   ids uuid[] — REQUIRED
   * */
  deleteDuplicates: (ids: Array<String>) => Promise<void>;

  /**
   * GET /duplicates
   *
   curl -L '/api/duplicates' \
   -H 'Accept: application/json'
   *
   * Responses
   200
   Schema — OPTIONAL
   object[]
   assets object[]
   checksum string
   base64 encoded sha1 hash

   deviceAssetId string
   deviceId string
   duplicateId string — OPTIONAL
   duration string
   exifInfo object — OPTIONAL
   city string — OPTIONAL
   country string — OPTIONAL
   dateTimeOriginal date-time — OPTIONAL
   description string — OPTIONAL
   exifImageHeight number — OPTIONAL
   exifImageWidth number — OPTIONAL
   exposureTime string — OPTIONAL
   fNumber number — OPTIONAL
   fileSizeInByte int64 — OPTIONAL
   focalLength number — OPTIONAL
   iso number — OPTIONAL
   latitude number — OPTIONAL
   lensModel string — OPTIONAL
   longitude number — OPTIONAL
   make string — OPTIONAL
   model string — OPTIONAL
   modifyDate date-time — OPTIONAL
   orientation string — OPTIONAL
   projectionType string — OPTIONAL
   rating number — OPTIONAL
   state string — OPTIONAL
   timeZone string — OPTIONAL
   fileCreatedAt date-time
   The actual UTC timestamp when the file was created/captured, preserving timezone information. This is the authoritative timestamp for chronological sorting within timeline groups. Combined with timezone data, this can be used to determine the exact moment the photo was taken.

   fileModifiedAt date-time
   The UTC timestamp when the file was last modified on the filesystem. This reflects the last time the physical file was changed, which may be different from when the photo was originally taken.

   hasMetadata boolean
   id string
   isArchived boolean
   isFavorite boolean
   isOffline boolean
   isTrashed boolean
   libraryId string — OPTIONAL
   This property was deprecated in v1.106.0

   livePhotoVideoId string — OPTIONAL
   localDateTime date-time
   The local date and time when the photo/video was taken, derived from EXIF metadata. This represents the photographer's local time regardless of timezone, stored as a timezone-agnostic timestamp. Used for timeline grouping by "local" days and months.

   originalFileName string
   originalMimeType string — OPTIONAL
   originalPath string
   owner object — OPTIONAL
   avatarColor string
   Possible values: [primary, pink, red, yellow, blue, green, purple, orange, gray, amber]

   email string
   id string
   name string
   profileChangedAt date-time
   profileImagePath string
   ownerId string
   people object[] — OPTIONAL
   birthDate date
   color string — OPTIONAL
   This property was added in v1.126.0

   faces object[]
   boundingBoxX1 integer
   boundingBoxX2 integer
   boundingBoxY1 integer
   boundingBoxY2 integer
   id uuid
   imageHeight integer
   imageWidth integer
   sourceType string — OPTIONAL
   Possible values: [machine-learning, exif, manual]

   id string
   isFavorite boolean — OPTIONAL
   This property was added in v1.126.0

   isHidden boolean
   name string
   thumbnailPath string
   updatedAt date-time — OPTIONAL
   This property was added in v1.107.0

   resized boolean — OPTIONAL
   This property was deprecated in v1.113.0

   stack object — OPTIONAL
   assetCount integer
   id string
   primaryAssetId string
   tags object[] — OPTIONAL
   color string — OPTIONAL
   createdAt date-time
   id string
   name string
   parentId string — OPTIONAL
   updatedAt date-time
   value string
   thumbhash string
   type string
   Possible values: [IMAGE, VIDEO, AUDIO, OTHER]

   unassignedFaces object[] — OPTIONAL
   boundingBoxX1 integer
   boundingBoxX2 integer
   boundingBoxY1 integer
   boundingBoxY2 integer
   id uuid
   imageHeight integer
   imageWidth integer
   sourceType string — OPTIONAL
   Possible values: [machine-learning, exif, manual]

   updatedAt date-time
   The UTC timestamp when the asset record was last updated in the database. This is automatically maintained by the database and reflects when any field in the asset was last modified.

   visibility string
   Possible values: [archive, timeline, hidden, locked]

   duplicateId string
   * */
  getAssetDuplicates: () => Promise<void>;

  /**
   * DELETE /duplicates/:id
   *
   * Path Parameters
   id uuid — REQUIRED
   *
   * */
  deleteDuplicate: (id: String) => Promise<void>;


}