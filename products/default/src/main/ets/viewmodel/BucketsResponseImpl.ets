import { BucketsResponseInterface } from "./BucketsResponseInterface";

export class BucketsResponseImpl implements BucketsResponseInterface {
  timeBucket: string = '';
  count: number = 0;

  constructor(timeBucket: string, count: number) {
    this.timeBucket = timeBucket;
    this.count = count;
  }
}