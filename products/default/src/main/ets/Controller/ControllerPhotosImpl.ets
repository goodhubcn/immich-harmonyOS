import { RCPUtils } from "../network/RCPUtils";
import { Authentication } from "../server/Authentication";
import { AuthenticationImpl } from "../server/AuthenticationImpl";
import { TimelineImpl } from "../server/TimelineImpl";
import { BucketResponseInterface } from "../viewmodel/BucketResponseInterface";
import { BucketsResponseInterface } from "../viewmodel/BucketsResponseInterface";
import { LoginResponseInterface } from "../viewmodel/LoginResponseInterface";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";
import { ControllerPhotosInterface } from "./ControllerPhotosInterface";
import { rcp } from "@kit.RemoteCommunicationKit";
import { BusinessError } from "@kit.BasicServicesKit";
import File from "@system.file";
import fileIO from "@ohos.fileio";

export class ControllerPhotosImpl implements ControllerPhotosInterface {

  private userInfo: LoginResponseInterface ;

  private buckets: BucketsResponseInterface[] = [];
  private photos: PhotosItemInterface[] = [];

  private PageCount: number = 30;
  private pageIndex: number = 0;

  constructor(userInfo: LoginResponseInterface) {
      this.userInfo = userInfo;
  }

  getNextTimeBuckets(): BucketsResponseInterface[] {

    let needBuckets: BucketsResponseInterface[] = [];

    let num = 0;

    for ( let i = this.pageIndex; i < this.buckets.length; i++ ) {
      num += this.buckets[i].count as number;

      if ( num <= this.PageCount ) {
        needBuckets.push(this.buckets[i]);
        this.pageIndex += 1;
      } else {
        break;
      }
    }

    return needBuckets;
  }

  addPhotos(bucket: BucketResponseInterface, ct: number): void {

    for (let i = 0; i < ct; i++ ) {
      let photo: PhotosItemInterface = {
        city: bucket.city[i],
        country: bucket.country[i],
        duration: bucket.duration[i],
        id: bucket.id[i],
        visibility: bucket.visibility[i],
        isFavorite: bucket.isFavorite[i],
        isImage: bucket.isImage[i],
        isTrashed: bucket.isTrashed[i],
        livePhotoVideoId: bucket.livePhotoVideoId[i],
        fileCreatedAt: bucket.fileCreatedAt[i],
        localOffsetHours: bucket.localOffsetHours[i],
        ownerId: bucket.ownerId[i],
        projectionType: bucket.projectionType[i],
        ratio: bucket.ratio[i],
        status: bucket.status[i],
        thumbhash: bucket.thumbhash[i],
        assetUrl: RCPUtils.getInstance().baseUrl() + `/api/assets/${bucket.id[i]}/thumbnail?size=thumbnail&c=${bucket.thumbhash[i]}`
      };
      this.photos.push(photo);
    }
  }

  async onLoad(): Promise<PhotosItemInterface[]> {
    console.log("ControllerPhotosImpl onLoad");


    // 1. getTimeBuckets
    await this.getTimeBuckets(this.userInfo.accessToken).then((response) => {
      console.log(`getTimeBuckets response: ${JSON.stringify(response)}`);
      this.buckets = response;
    }).catch((error: Error) => {
      console.error(`getTimeBuckets error: ${error.message}`);
    });

    // 2. getTimeBucket
    let urls = this.getNextTimeBuckets();
    if ( urls.length > 0 ) {

      for ( let bucket of urls ) {

        let timeline = new TimelineImpl(RCPUtils.getInstance());
        await timeline.getTimeBucket(this.userInfo.accessToken, bucket.timeBucket).then((response) => {

          // 处理 response，例如将照片添加到某个列表中
          this.addPhotos(response, bucket.count as number);

        }).catch((error: Error) => {
          console.error(`getTimeBucket error for ${bucket.timeBucket}: ${error.message}`);
        });

      }
    }

    return this.photos;
  }

  async onNextLoad(): Promise<PhotosItemInterface[]> {
    console.log("ControllerPhotosImpl onNextLoad");
    return [];
  }

  async getTimeBuckets(
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
  ): Promise<BucketsResponseInterface[]> {

    let timeline = new TimelineImpl(RCPUtils.getInstance());

    let resp: BucketsResponseInterface[] = [];

    console.log('accessToken: ' + accessToken);

    await timeline.getTimeBuckets(accessToken).then((response) => {
      console.log(`getTimeBuckets response: ${JSON.stringify(response)}`);

      resp = response;
    }).catch((error: Error) => {
      console.error(`getTimeBuckets error: ${error.message}`);
    });

    return resp;
  }


  async loadImage2Local(url: string): Promise<ArrayBuffer> {

    const sessionConfig: rcp.SessionConfiguration = {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + this.userInfo.accessToken
      },
    };

    let rcpSession = rcp.createSession(sessionConfig);
//ArrayBuffer
    let data: ArrayBuffer = new ArrayBuffer(0);

    await rcpSession.get(url).then((response) => {

      if ( response.body) {
        data = response.body;
      }

    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
      throw new Error(`Failed to load image from ${url}: ${err.message}`);
    });

    return data;
  }

}