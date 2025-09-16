import { RCPUtils } from "../network/RCPUtils";
import { Timeline } from "./Timeline";
import { BusinessError } from "@kit.BasicServicesKit";
import { BucketsResponseInterface } from "../viewmodel/BucketsResponseInterface";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";
import { rcp } from "@kit.RemoteCommunicationKit";
import { BucketResponseInterface } from "../viewmodel/BucketResponseInterface";

export class TimelineImpl implements Timeline {

  private rcputils: RCPUtils|undefined = undefined;
  constructor(utils: RCPUtils) {
    this.rcputils = utils;
  }

  async getTimeBucket(
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
  ): Promise<BucketResponseInterface> {
    // http://192.168.1.50:8086/api/timeline/bucket?timeBucket=2025-06-01T00%3A00%3A00.000Z&visibility=timeline&withPartners=true&withStacked=true

    let getURL = this.rcputils?.baseUrl() + '/api/timeline/bucket?timeBucket=' + encodeURIComponent(timeBucket) + '&visibility=timeline&withPartners=true&withStacked=true';

    // let respData: PhotosItemInterface = {};

    let respData: BucketResponseInterface = {} as BucketResponseInterface;

    const sessionConfig: rcp.SessionConfiguration = {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + accessToken
      },
      // timeout: 10000, // 10 seconds timeout
    };

    let rcpSession = rcp.createSession(sessionConfig);

    await rcpSession.get(getURL).then((response) => {
      console.info(`Response succeeded: ${response}`);

      respData = response.toJSON() as BucketResponseInterface;

    }).catch((err: BusinessError) => {
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    });

    rcpSession.close();

    return respData;
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

    let getURL = this.rcputils?.baseUrl() + '/api/timeline/buckets?visibility=timeline&withPartners=true&withStacked=true';

    let respData: BucketsResponseInterface[] = [];

    const sessionConfig: rcp.SessionConfiguration = {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + accessToken
      },
      // timeout: 10000, // 10 seconds timeout
    };

    let rcpSession = rcp.createSession(sessionConfig);

    // 3、使用session.get发起请求，以getURL为入参，使用Promise进行异步回调。
    await rcpSession.get(getURL).then((response) => {
      console.info(`Response succeeded: ${response}`);

      respData = response.toJSON() as BucketsResponseInterface[];

    }).catch((err: BusinessError) => {
      // 4、错误处理，通过catch块，捕获error，并对error进行处理，本示例中会将错误信息展现到打印台上。
      console.error(`Response err: Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err)}`);
    });

    rcpSession.close();

    return respData;
  }

}