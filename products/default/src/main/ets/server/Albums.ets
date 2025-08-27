export interface Albums {
  //
  // https://v1.137.1.archive.immich.app/docs/api/get-albums
  //

  /**
   * GET /albums
   curl -L '/api/albums' \
   -H 'Accept: application/json'
   * */
  getAlbums: () => Promise<void>;

  /**
   * POST /albums
   *
   * curl -L '/api/albums' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "albumName": "string",
   "albumUsers": [
   {
   "role": "editor", // "viewer" | "editor"
   "userId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   }
   ],
   "assetIds": [
   "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   ],
   "description": "string"
   }'
   *
   * */
  createAlbum: (albumName: String, role: String, userId: String, assetIds: Array<String>, description: String) => Promise<void>;

  /**
   * GET /albums/statistics
   *
   * curl -L '/api/albums/statistics' \
   -H 'Accept: application/json'
   * */
  getAlbumStatistics: () => Promise<void>;

  /**
   * DELETE /albums/:id
   * curl -L -X DELETE '/api/albums/:id'
   *
   * */
  deleteAlbum: (id: String) => Promise<void>;

  /**
   * GET /albums/:id
   *
   * curl -L '/api/albums/:id' \
   -H 'Accept: application/json'
   * */
  getAlbumInfo: (id: String) => Promise<void>;

  /**
   * PATCH /albums/:id
   *
   * curl -L -X PATCH '/api/albums/:id' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "albumName": "string",
   "albumThumbnailAssetId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
   "description": "string",
   "isActivityEnabled": true,
   "order": "asc" // "asc" | "desc"
   }'
   *
   * */
  updateAlbumInfo: (id: String, albumName: String, albumThumbnailAssetId: String, description: String, isActivityEnabled: boolean, order: String) => Promise<void>;

  /**
   *
   * DELETE /albums/:id/assets
   *
   * curl -L -X DELETE '/api/albums/:id/assets' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "ids": [
   "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   ]
   }'
   *
   * */
  removeAssetFromAlbum: (id: String, assetIds: Array<String>) => Promise<void>;

  /**
   * PUT /albums/:id/assets
   *
   * curl -L -X PUT '/api/albums/:id/assets' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "ids": [
   "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   ]
   }'
   *
   * */
  addAssetsToAlbum: (id: String, assetIds: Array<String>) => Promise<void>;

  /**
   * DELETE /albums/:id/user/:userId
   *
   * curl -L -X DELETE '/api/albums/:id/user/:userId'
   *
   * */
  removeUserFromAlbum: (id: String, userId: String) => Promise<void>;

  /**
   * PUT /albums/:id/user/:userId
   *
   * curl -L -X PUT '/api/albums/:id/user/:userId' \
   -H 'Content-Type: application/json' \
   -d '{
   "role": "editor" // "viewer" | "editor"
   }'
   *
   * */
  updateAlbumUserRole: (id: String, userId: String, role: String) => Promise<void>;

  /**
   * PUT /albums/:id/users
   *
   * curl -L -X PUT '/api/albums/:id/users' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "albumUsers": [
   {
   "role": "editor", // "viewer" | "editor"
   "userId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   }
   ]
   }'
   *
   * */
  addUsersToAlbum: (id: String, role: String, userId: String) => Promise<void>;

}