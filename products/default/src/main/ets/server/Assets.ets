export interface CheckBulkUploadItemInterface {
  checksum: string;
  id: string;
}

export interface Assets {
  //
  // https://v1.138.0.archive.immich.app/docs/api/delete-assets
  //

  /**
   * DELETE /assets
   curl -L -X DELETE '/api/assets' \
   -H 'Content-Type: application/json' \
   -d '{
   "force": true,
   "ids": [
   "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   ]
   }'
   */
  deleteAssets: (force: boolean, ids: Array<String>) => Promise<void>;

  /**
   * POST /assets
   curl -L -X POST '/api/assets' \
   -H 'Content-Type: multipart/form-data' \
   -H 'Accept: application/json'

   Request Body — REQUIRED
   Asset Upload Information

   assetData binary — REQUIRED
   deviceAssetId string — REQUIRED
   deviceId string — REQUIRED
   duration string
   fileCreatedAt date-time — REQUIRED
   fileModifiedAt date-time — REQUIRED
   filename string
   isFavorite boolean
   livePhotoVideoId uuid
   sidecarData binary
   visibility string
   Possible values: [archive, timeline, hidden, locked]

   */
  uploadAsset: (
    assetData: any,
    deviceAssetId: string,
    deviceId: string,
    fileCreatedAt: Date,
    fileModifiedAt: Date,
    filename?: string,
    isFavorite?: boolean,
    livePhotoVideoId?: string,
    sidecarData?: any,
    visibility?: 'archive' | 'timeline' | 'hidden' | 'locked'
  ) => Promise<void>;

  /**
   * PUT /assets
   *
   curl -L -X PUT '/api/assets' \
   -H 'Content-Type: application/json' \
   -d '{
   "dateTimeOriginal": "string",
   "dateTimeRelative": 0,
   "description": "string",
   "duplicateId": "string",
   "ids": [
   "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   ],
   "isFavorite": true,
   "latitude": 0,
   "longitude": 0,
   "rating": 0,
   "timeZone": "string",
   "visibility": "archive"
   }'
   */
  updateAssets: (
    dateTimeOriginal: string,
    dateTimeRelative: number,
    description: string,
    duplicateId: string,
    ids: Array<string>,
    isFavorite: boolean,
    latitude: number,
    longitude: number,
    rating: number,
    timeZone: string,
    visibility: 'archive' | 'timeline' | 'hidden' | 'locked'
  ) => Promise<void>;

  /**
   * POST /assets/bulk-upload-check
   *
   * curl -L '/api/assets/bulk-upload-check' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "assets": [
   {
   "checksum": "string",
   "id": "string"
   }
   ]
   }'
   * */
  checkBulkUpload: (assets: Array<CheckBulkUploadItemInterface>) => Promise<void>;

  /**
   * GET /assets/device/:deviceId
   *
   * curl -L '/api/assets/device/:deviceId' \
   -H 'Accept: application/json'
   *
   * */
  getAllUserAssetsByDeviceId: (deviceId: string) => Promise<void>;

  /**
   * POST /assets/exist
   *
   * curl -L '/api/assets/exist' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "deviceAssetIds": [
   "string"
   ],
   "deviceId": "string"
   }'
   *
   * */
  checkExistingAssets: (deviceAssetIds: Array<string>, deviceId: string) => Promise<void>;

  /**
   * POST /assets/jobs
   *
   * curl -L '/api/assets/jobs' \
   -H 'Content-Type: application/json' \
   -d '{
   "assetIds": [
   "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   ],
   "name": "refresh-faces"
   }'
   *
   *
   * Request Body — REQUIRED
   assetIds uuid[] — REQUIRED
   name string — REQUIRED
   Possible values: [refresh-faces, refresh-metadata, regenerate-thumbnail, transcode-video]
   * */
  runAssetJobs: (
    assetIds: Array<string>,
    name: 'refresh-faces' | 'refresh-metadata' | 'regenerate-thumbnail' | 'transcode-video'
  ) => Promise<void>;

  /**
   * GET /assets/statistics
   *
   * curl -L '/api/assets/statistics' \
   -H 'Accept: application/json'
   *
   * Query Parameters
   isFavorite boolean
   isTrashed boolean
   visibility string
   Possible values: [archive, timeline, hidden, locked]
   * */
  getAssetStatistics: (isFavorite?: boolean, isTrashed?: boolean, visibility?: 'archive' | 'timeline' | 'hidden' | 'locked') => Promise<void>;

  /**
   * GET /assets/:id
   *
   * curl -L '/api/assets/:id' \
   -H 'Accept: application/json'
   *
   * Path Parameters
   id uuid — REQUIRED
   Query Parameters
   key string
   slug string
   * */
  getAssetInfo: (id: string, key?: string, slug?: string) => Promise<void>;

  /**
   * PUT /assets/:id
   *
   * curl -L -X PUT '/api/assets/:id' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "dateTimeOriginal": "string",
   "description": "string",
   "isFavorite": true,
   "latitude": 0,
   "livePhotoVideoId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
   "longitude": 0,
   "rating": 0,
   "visibility": "archive"
   }'
   *
   * Path Parameters
   id uuid — REQUIRED
   Request Body — REQUIRED
   dateTimeOriginal string
   description string
   isFavorite boolean
   latitude number
   livePhotoVideoId uuid
   longitude number
   rating number Possible values: -1 ≤ value ≤ 5

   visibility string
   Possible values: [archive, timeline, hidden, locked]
   * */
  updateAsset: (
    id: string,
    dateTimeOriginal: string,
    description: string,
    isFavorite: boolean,
    latitude: number,
    livePhotoVideoId: string,
    longitude: number,
    rating: number,
    visibility: 'archive' | 'timeline' | 'hidden' | 'locked'
  ) => Promise<void>;

  /**
   * GET /assets/:id/original
   *
   * curl -L '/api/assets/:id/original' \
   -H 'Accept: application/octet-stream'
   *
   * Path Parameters
   id uuid — REQUIRED
   Query Parameters
   key string
   slug string
   * */
  downloadAsset: (id: string, key?: string, slug?: string) => Promise<void>;

  /**
   * PUT /assets/:id/original
   *
   * curl -L -X PUT '/api/assets/:id/original' \
   -H 'Content-Type: multipart/form-data' \
   -H 'Accept: application/json'
   *
   * Path Parameters
   id uuid — REQUIRED
   Query Parameters
   key string
   slug string
   Request Body — REQUIRED
   assetData binary — REQUIRED
   deviceAssetId string — REQUIRED
   deviceId string — REQUIRED
   duration string
   fileCreatedAt date-time — REQUIRED
   fileModifiedAt date-time — REQUIRED
   filename string
   * */
  replaceAsset: (
    id: string,
    key?: string,
    slug?: string,
    assetData: any,
    deviceAssetId: string,
    deviceId: string,
    duration?: string,
    fileCreatedAt: Date,
    fileModifiedAt: Date,
    filename?: string,
  ) => Promise<void>;

  /**
   *
   * GET /assets/:id/thumbnail
   *
   * http://192.168.1.50:8086/api/assets/79c512ac-e92e-4b18-bc0a-2412556f291c/thumbnail?size=preview&c=%2BfcFCwBogReHcYEwT5n4lIg%3D
   * http://192.168.1.50:8086/api/assets/79c512ac-e92e-4b18-bc0a-2412556f291c/thumbnail?size=thumbnail&c=%2BfcFCwBogReHcYEwT5n4lIg%3D
   *
   * curl -L '/api/assets/:id/thumbnail' \
   -H 'Accept: application/octet-stream'
   *
   * Path Parameters
   id uuid — REQUIRED
   Query Parameters
   key string
   size string Possible values: [fullsize, preview, thumbnail]
   slug string
   * */
  viewAsset: (id: string, key?: string, size?: 'fullsize' | 'preview' | 'thumbnail', slug?: string) => Promise<void>;

  /**
   *
   * GET /assets/:id/video/playback
   *
   * curl -L '/api/assets/:id/video/playback' \
   -H 'Accept: application/octet-stream'
   *
   *
   * Path Parameters
   id uuid — REQUIRED
   Query Parameters
   key string
   slug string
   * */
  playAssetVideo: (id: string, key?: string, slug?: string) => Promise<void>;


}