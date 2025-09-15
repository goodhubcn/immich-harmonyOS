import { BucketResponseInterface } from "../viewmodel/BucketResponseInterface";
import { BucketsResponseInterface } from "../viewmodel/BucketsResponseInterface";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";

export interface Timeline {
  //
  // https://v1.137.1.archive.immich.app/docs/api/get-assets-timeline
  //

  /**
   * GET /timeline/bucket
   *
   * http://192.168.1.50:8086/api/timeline/bucket?timeBucket=2025-08-01T00%3A00%3A00.000Z&visibility=timeline&withPartners=true&withStacked=true
   * {
   "city": [
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   "Renhe",
   "Renhe",
   "Renhe",
   "Renhe",
   "Renhe",
   "Renhe",
   "Renhe",
   "Renhe",
   "Renhe"
   ],
   "country": [
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   "People's Republic of China",
   "People's Republic of China",
   "People's Republic of China",
   "People's Republic of China",
   "People's Republic of China",
   "People's Republic of China",
   "People's Republic of China",
   "People's Republic of China",
   "People's Republic of China"
   ],
   "duration": [
   null,
   null,
   null,
   null,
   null,
   "00:00:05.387",
   null,
   null,
   "00:00:14.675",
   "00:00:01.393",
   "00:00:09.961",
   "00:00:19.535",
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null
   ],
   "id": [
   "79c512ac-e92e-4b18-bc0a-2412556f291c",
   "c98fe2db-28b2-4f48-b381-432747d583bd",
   "ce3cee3b-74f2-49d9-8177-bf3523e414ea",
   "467118e7-5e8d-4fd6-b4ca-5097ae7b3f5b",
   "8842bcdc-06b6-4846-b9c3-6c64fc8bceec",
   "ff28184a-0c45-4346-b046-0f2af4186cc0",
   "1ef6ebd4-5878-4c0d-ab5a-156547b65241",
   "598f57c4-c1b4-4492-9ef2-06e40b8cab22",
   "091993ef-194b-42c3-ac0a-c6de28f8e5b2",
   "3b2f3b13-51d0-4be9-810e-288d65b4704d",
   "562f523d-3e5f-4393-8895-e4d955911929",
   "667ca2ad-b147-4182-b47c-3d5d0de362c5",
   "b84fbfb4-29cc-407c-85bf-8cab691de26d",
   "6fe549b0-9f37-4373-96a7-30c0935c758d",
   "7b7321ed-27e0-403b-9d1d-4a72d7fcc5f3",
   "45fdcac7-86cc-4942-bb66-538c35382327",
   "b6e0bec0-40e1-434b-af6b-ce317e28d17d",
   "5faf5c79-932a-4f43-977c-f3a80934be13",
   "1897b1ab-4e0c-40af-83d5-297dc84ec719",
   "fe58a010-abed-4235-b2ee-369c1cbae039",
   "345eaab0-5cf5-49b9-9e0e-5215790e2a0b"
   ],
   "visibility": [
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline",
   "timeline"
   ],
   "isFavorite": [
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false
   ],
   "isImage": [
   true,
   true,
   true,
   true,
   true,
   false,
   true,
   true,
   false,
   false,
   false,
   false,
   true,
   true,
   true,
   true,
   true,
   true,
   true,
   true,
   true
   ],
   "isTrashed": [
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false,
   false
   ],
   "livePhotoVideoId": [
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null
   ],
   "fileCreatedAt": [
   "2025-08-24T15:57:51.654",
   "2025-08-24T15:56:53.047",
   "2025-08-24T15:55:46.731",
   "2025-08-24T15:55:23.901",
   "2025-08-05T07:15:49",
   "2025-08-02T05:53:41",
   "2025-08-01T10:30:36",
   "2025-08-01T10:01:46",
   "2025-08-01T06:07:15",
   "2025-08-01T06:06:36",
   "2025-08-01T06:05:54",
   "2025-08-01T06:05:04",
   "2025-08-01T06:00:10.752",
   "2025-08-01T06:00:09.633",
   "2025-08-01T06:00:04.042",
   "2025-08-01T05:59:58.735",
   "2025-08-01T05:59:55.734",
   "2025-08-01T05:59:41.111",
   "2025-08-01T01:23:43.692",
   "2025-08-01T01:23:31.2",
   "2025-08-01T01:23:20.203"
   ],
   "localOffsetHours": [
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   8,
   8,
   8,
   8,
   8,
   8,
   8,
   8,
   8
   ],
   "ownerId": [
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563",
   "09eae677-1b31-4839-8911-66dedd71a563"
   ],
   "projectionType": [
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null
   ],
   "ratio": [
   0.443,
   0.443,
   0.443,
   0.443,
   0.563,
   0.563,
   0.563,
   0.563,
   0.563,
   0.563,
   0.563,
   0.563,
   0.750,
   0.750,
   0.750,
   0.750,
   0.750,
   0.750,
   0.750,
   0.750,
   0.750
   ],
   "status": [
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active",
   "active"
   ],
   "thumbhash": [
   "+fcFCwBogReHcYEwT5n4lIg=",
   "+fcFAwB4gRiHcIEwb5r5lok=",
   "+fcJAwB4ghiHgYEwf439x8g=",
   "+fcJAwB4ghiHcYEwf4z5t5g=",
   "WPgJFAJ1RofXZpBYmneHmY8JiA==",
   "pSgODARfuJenhYZZmncTID0Gww==",
   "HCkOLAZ3yIlHh3+XaFdnhYBWCA==",
   "3CgKJASWyYcmmH+miLZnd3BmBw==",
   "oggKDARW96l3d3Z1iohwZHJYCQ==",
   "5PcJJASAN4RodmeWd6iYV0A5BA==",
   "oPgJDAR79od4h5lkeIkFLZCEMA==",
   "X/gJFARW+7Z4qV93ZowwRka1Ag==",
   "nAgGHQTsbJ+F6JVVmElYlmtv99TW",
   "mggOFQSseZ9mqJeFd1d4iFx/yPWV",
   "YPgJHQSjxrtn95d5p2mUln+f+Mfr",
   "nvgNFQRpiY9od4d2Zod4eQdvs/A1",
   "n/gNFQZ4in9nd4d3Z4doeDtvkPJH",
   "oAgOFQLKan91eHlmhXd5aVh/kvgk",
   "YRgKDQKRjI5Y+Hl2iadnmHSAChio",
   "pBgKFQKHdW6G+XZYh3VImWmQhQRa",
   "ohgKDQJjmJ+J5pd2eYZqeVSgBhVr"
   ],
   "stack": [
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null,
   null
   ]
   }
   *
   *
   * http://192.168.1.50:8086/api/timeline/buckets?visibility=timeline&withPartners=true&withStacked=true
   *[
   {
   "timeBucket": "2025-08-01",
   "count": 21
   },
   {
   "timeBucket": "2025-07-01",
   "count": 71
   },
   {
   "timeBucket": "2025-06-01",
   "count": 156
   },
   {
   "timeBucket": "2025-05-01",
   "count": 254
   },
   {
   "timeBucket": "2025-04-01",
   "count": 157
   },
   {
   "timeBucket": "2025-03-01",
   "count": 76
   },
   {
   "timeBucket": "2025-02-01",
   "count": 63
   },
   {
   "timeBucket": "2025-01-01",
   "count": 110
   },
   {
   "timeBucket": "2024-12-01",
   "count": 109
   },
   {
   "timeBucket": "2024-11-01",
   "count": 351
   },
   {
   "timeBucket": "2024-10-01",
   "count": 238
   },
   {
   "timeBucket": "2024-09-01",
   "count": 181
   },
   {
   "timeBucket": "2024-08-01",
   "count": 198
   },
   {
   "timeBucket": "2024-07-01",
   "count": 860
   },
   {
   "timeBucket": "2024-06-01",
   "count": 48
   },
   {
   "timeBucket": "2024-05-01",
   "count": 55
   },
   {
   "timeBucket": "2024-04-01",
   "count": 10
   },
   {
   "timeBucket": "2024-03-01",
   "count": 63
   },
   {
   "timeBucket": "2024-02-01",
   "count": 50
   },
   {
   "timeBucket": "2024-01-01",
   "count": 23
   },
   {
   "timeBucket": "2023-12-01",
   "count": 28
   },
   {
   "timeBucket": "2023-11-01",
   "count": 44
   },
   {
   "timeBucket": "2023-10-01",
   "count": 51
   },
   {
   "timeBucket": "2023-09-01",
   "count": 60
   },
   {
   "timeBucket": "2023-08-01",
   "count": 57
   },
   {
   "timeBucket": "2023-07-01",
   "count": 44
   },
   {
   "timeBucket": "2023-06-01",
   "count": 76
   },
   {
   "timeBucket": "2023-05-01",
   "count": 60
   },
   {
   "timeBucket": "2023-04-01",
   "count": 179
   },
   {
   "timeBucket": "2023-03-01",
   "count": 74
   },
   {
   "timeBucket": "2023-02-01",
   "count": 53
   },
   {
   "timeBucket": "2023-01-01",
   "count": 78
   },
   {
   "timeBucket": "2022-12-01",
   "count": 42
   },
   {
   "timeBucket": "2022-11-01",
   "count": 62
   },
   {
   "timeBucket": "2022-10-01",
   "count": 65
   },
   {
   "timeBucket": "2022-09-01",
   "count": 67
   },
   {
   "timeBucket": "2022-08-01",
   "count": 33
   },
   {
   "timeBucket": "2022-07-01",
   "count": 44
   },
   {
   "timeBucket": "2022-06-01",
   "count": 32
   },
   {
   "timeBucket": "2022-05-01",
   "count": 94
   },
   {
   "timeBucket": "2022-04-01",
   "count": 38
   },
   {
   "timeBucket": "2022-03-01",
   "count": 25
   },
   {
   "timeBucket": "2022-02-01",
   "count": 52
   },
   {
   "timeBucket": "2022-01-01",
   "count": 35
   },
   {
   "timeBucket": "2021-12-01",
   "count": 12
   },
   {
   "timeBucket": "2021-11-01",
   "count": 13
   },
   {
   "timeBucket": "2021-10-01",
   "count": 6
   },
   {
   "timeBucket": "2021-09-01",
   "count": 6
   },
   {
   "timeBucket": "2021-08-01",
   "count": 19
   },
   {
   "timeBucket": "2021-07-01",
   "count": 95
   },
   {
   "timeBucket": "2021-06-01",
   "count": 22
   },
   {
   "timeBucket": "2021-05-01",
   "count": 1
   },
   {
   "timeBucket": "2021-03-01",
   "count": 12
   },
   {
   "timeBucket": "2021-02-01",
   "count": 2
   },
   {
   "timeBucket": "2021-01-01",
   "count": 48
   },
   {
   "timeBucket": "2020-11-01",
   "count": 2
   },
   {
   "timeBucket": "2020-09-01",
   "count": 2
   },
   {
   "timeBucket": "2020-08-01",
   "count": 1
   },
   {
   "timeBucket": "2020-07-01",
   "count": 1
   },
   {
   "timeBucket": "2020-06-01",
   "count": 11
   },
   {
   "timeBucket": "2020-05-01",
   "count": 6
   },
   {
   "timeBucket": "2020-04-01",
   "count": 1
   },
   {
   "timeBucket": "2020-02-01",
   "count": 1
   },
   {
   "timeBucket": "2020-01-01",
   "count": 11
   },
   {
   "timeBucket": "2019-12-01",
   "count": 37
   },
   {
   "timeBucket": "2019-10-01",
   "count": 6
   },
   {
   "timeBucket": "2019-09-01",
   "count": 91
   },
   {
   "timeBucket": "2019-08-01",
   "count": 4
   },
   {
   "timeBucket": "2019-07-01",
   "count": 6
   },
   {
   "timeBucket": "2019-06-01",
   "count": 2
   },
   {
   "timeBucket": "2019-05-01",
   "count": 28
   },
   {
   "timeBucket": "2019-04-01",
   "count": 2
   },
   {
   "timeBucket": "2019-03-01",
   "count": 4
   },
   {
   "timeBucket": "2019-02-01",
   "count": 11
   },
   {
   "timeBucket": "2019-01-01",
   "count": 14
   },
   {
   "timeBucket": "2018-12-01",
   "count": 11
   },
   {
   "timeBucket": "2018-11-01",
   "count": 5
   },
   {
   "timeBucket": "2018-10-01",
   "count": 118
   },
   {
   "timeBucket": "2018-09-01",
   "count": 1
   },
   {
   "timeBucket": "2018-08-01",
   "count": 18
   },
   {
   "timeBucket": "2018-07-01",
   "count": 6
   },
   {
   "timeBucket": "2018-06-01",
   "count": 10
   },
   {
   "timeBucket": "2018-05-01",
   "count": 2
   },
   {
   "timeBucket": "2018-04-01",
   "count": 1
   },
   {
   "timeBucket": "2017-01-01",
   "count": 1
   },
   {
   "timeBucket": "2015-01-01",
   "count": 36
   },
   {
   "timeBucket": "2014-12-01",
   "count": 4
   },
   {
   "timeBucket": "2014-11-01",
   "count": 40
   },
   {
   "timeBucket": "2014-10-01",
   "count": 85
   },
   {
   "timeBucket": "2014-07-01",
   "count": 1
   },
   {
   "timeBucket": "2014-05-01",
   "count": 3
   },
   {
   "timeBucket": "2014-04-01",
   "count": 27
   },
   {
   "timeBucket": "2014-02-01",
   "count": 12
   },
   {
   "timeBucket": "2013-10-01",
   "count": 117
   },
   {
   "timeBucket": "2013-09-01",
   "count": 7
   },
   {
   "timeBucket": "2013-06-01",
   "count": 1
   },
   {
   "timeBucket": "2012-06-01",
   "count": 8
   }
   ]
   *
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
    accessToken: string,
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
  ) => Promise<BucketResponseInterface>;

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
    accessToken: string,
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
  ) => Promise<BucketsResponseInterface[]>;


}