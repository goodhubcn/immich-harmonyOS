export interface CreateMemoryDataYearInterface {
  year: number;
}

export interface Memories {
  //
  // https://v1.137.1.archive.immich.app/docs/api/get-memories
  //

  /**
   * GET /memories
   *
   * http://192.168.1.50:8086/api/memories?for=2025-08-26T16%3A12%3A58.569Z
   *
   * curl -L '/api/memories' \
   -H 'Accept: application/json'
   *
   * Query Parameters
   for date-time
   isSaved boolean
   isTrashed boolean
   type string
   Possible values: [on_this_day]
   *
   * */
  searchMemories: (forDate: Date, isSaved?: boolean, isTrashed?: boolean, type?: 'on_this_day') => Promise<void>;

  /**
   * POST /memories
   *
   * curl -L '/api/memories' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "assetIds": [
   "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   ],
   "data": {
   "year": 0
   },
   "isSaved": true,
   "memoryAt": "string",
   "seenAt": "string",
   "type": "on_this_day"
   }'
   *
   * Request Body — REQUIRED
   assetIds uuid[]
   data object — REQUIRED
   year number — REQUIRED
   Possible values: 1 ≤ value

   isSaved boolean
   memoryAt date-time — REQUIRED
   seenAt date-time
   type string — REQUIRED
   Possible values: [on_this_day]
   * */
  createMemory: (
    assetIds: Array<String>,
    data: CreateMemoryDataYearInterface,
    isSaved: boolean,
    memoryAt: Date,
    seenAt?: Date,
    type?: 'on_this_day' ) => Promise<void>;

  /**
   * GET /memories/statistics
   *
   * curl -L '/api/memories/statistics' \
   -H 'Accept: application/json'
   *
   * Query Parameters
   for date-time
   isSaved boolean
   isTrashed boolean
   type string
   Possible values: [on_this_day]

   * */
  memoriesStatistics: (forDate: Date, isSaved?: boolean, isTrashed?: boolean, type?: 'on_this_day') => Promise<void>;

  /**
   * DELETE /memories/:id
   * curl -L -X DELETE '/api/memories/:id'
   *
   * Path Parameters
   id uuid — REQUIRED
   *
   * */
  deleteMemory: (id: String) => Promise<void>;

  /**
   * GET /memories/:id
   *
   * curl -L '/api/memories/:id' \
   -H 'Accept: application/json'
   *
   * Path Parameters
   id uuid — REQUIRED
   *
   * */
  getMemory: (id: String) => Promise<void>;

  /**
   *
   * PUT /memories/:id
   *
   * curl -L -X PUT '/api/memories/:id' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "isSaved": true,
   "memoryAt": "string",
   "seenAt": "string"
   }'
   *
   * Path Parameters
   id uuid — REQUIRED
   Request Body — REQUIRED
   isSaved boolean
   memoryAt date-time
   seenAt date-time
   * */
  updateMemory: (id: String, isSaved?: boolean, memoryAt?: Date, seenAt?: Date) => Promise<void>;

  /**
   * DELETE /memories/:id/assets
   *
   * Path Parameters
   id uuid — REQUIRED
   Request Body — REQUIRED
   ids uuid[] — REQUIRED
   *
   *
   * */
  removeMemoryAssets: (id: String, assetIds: Array<String>) => Promise<void>;

  /**
   * PUT /memories/:id/assets
   *
   * curl -L -X PUT '/api/memories/:id/assets' \
   -H 'Content-Type: application/json' \
   -H 'Accept: application/json' \
   -d '{
   "ids": [
   "3fa85f64-5717-4562-b3fc-2c963f66afa6"
   ]
   }'
   *
   * Path Parameters
   id uuid — REQUIRED
   Request Body — REQUIRED
   ids uuid[] — REQUIRED
   * */
  addMemoryAssets: (id: String, assetIds: Array<String>) => Promise<void>;


}