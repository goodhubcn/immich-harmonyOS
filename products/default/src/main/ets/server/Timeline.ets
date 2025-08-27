export interface Timeline {
  //
  // https://v1.137.1.archive.immich.app/docs/api/get-assets-timeline
  //

  /**
   * GET /timeline/bucket
   *
   * http://192.168.1.50:8086/api/timeline/bucket?timeBucket=2025-08-01T00%3A00%3A00.000Z&visibility=timeline&withPartners=true&withStacked=true
   *
   * curl -L '/api/timeline/bucket' \
   * -H 'Accept: application/json'
   *
   *
   * Query Parameters
   albumId uuid
   Filter assets belonging to a specific album

   isFavorite boolean
   Filter by favorite status (true for favorites only, false for non-favorites only)

   isTrashed boolean
   Filter by trash status (true for trashed assets only, false for non-trashed only)

   key string
   order string
   Possible values: [asc, desc]

   Sort order for assets within time buckets (ASC for oldest first, DESC for newest first)

   personId uuid
   Filter assets containing a specific person (face recognition)

   slug string
   tagId uuid
   Filter assets with a specific tag

   timeBucket string — REQUIRED
   Time bucket identifier in YYYY-MM-DD format (e.g., "2024-01-01" for January 2024)

   userId uuid
   Filter assets by specific user ID

   visibility string
   Possible values: [archive, timeline, hidden, locked]

   Filter by asset visibility status (ARCHIVE, TIMELINE, HIDDEN, LOCKED)

   withPartners boolean
   Include assets shared by partners

   withStacked boolean
   Include stacked assets in the response. When true, only primary assets from stacks are returned.
   * */
  getTimeBucket: (
    timeBucket: string,
    albumId?: string,
    isFavorite?: boolean,
    isTrashed?: boolean,
    key?: string,
    order?: 'asc' | 'desc',
    personId?: string,
    slug?: string,
    userId?: string,
    visibility?: 'archive' | 'timeline' | 'hidden' | 'locked',
    withPartners?: boolean,
    withStacked?: boolean
  ) => Promise<void>;

  /**
   * GET /timeline/buckets
   *
   * http://192.168.1.50:8086/api/timeline/buckets?visibility=timeline&withPartners=true&withStacked=true
   *
   * http://192.168.1.50:8086/api/assets/8842bcdc-06b6-4846-b9c3-6c64fc8bceec/thumbnail?size=thumbnail&c=WPgJFAJ1RofXZpBYmneHmY8JiA%3D%3D
   *
   * curl -L '/api/timeline/buckets' \
   -H 'Accept: application/json'
   *
   * Query Parameters
   albumId uuid
   Filter assets belonging to a specific album

   isFavorite boolean
   Filter by favorite status (true for favorites only, false for non-favorites only)

   isTrashed boolean
   Filter by trash status (true for trashed assets only, false for non-trashed only)

   key string
   order string
   Possible values: [asc, desc]

   Sort order for assets within time buckets (ASC for oldest first, DESC for newest first)

   personId uuid
   Filter assets containing a specific person (face recognition)

   slug string
   tagId uuid
   Filter assets with a specific tag

   userId uuid
   Filter assets by specific user ID

   visibility string
   Possible values: [archive, timeline, hidden, locked]

   Filter by asset visibility status (ARCHIVE, TIMELINE, HIDDEN, LOCKED)

   withPartners boolean
   Include assets shared by partners

   withStacked boolean
   Include stacked assets in the response. When true, only primary assets from stacks are returned.

   * */
  getTimeBuckets: (
    albumId?: string,
    isFavorite?: boolean,
    isTrashed?: boolean,
    key?: string,
    order?: 'asc' | 'desc',
    personId?: string,
    slug?: string,
    userId?: string,
    visibility?: 'archive' | 'timeline' | 'hidden' | 'locked',
    withPartners?: boolean,
    withStacked?: boolean
  ) => Promise<void>;


}