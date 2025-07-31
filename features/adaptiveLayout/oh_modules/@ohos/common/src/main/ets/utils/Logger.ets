import { hilog } from '@kit.PerformanceAnalysisKit';

const PREFIX: string = 'testTag';
const DOMAIN: number = 0xFF00;
const FORMAT: string = '%{public}s, %{public}s';

export function debug(...args: string[]): void {
  hilog.debug(DOMAIN, PREFIX, FORMAT, args);
}

export function info(...args: string[]): void {
  hilog.info(DOMAIN, PREFIX, FORMAT, args);
}

export function warn(...args: string[]): void {
  hilog.warn(DOMAIN, PREFIX, FORMAT, args);
}

export function error(...args: string[]): void {
  hilog.error(DOMAIN, PREFIX, FORMAT, args);
}