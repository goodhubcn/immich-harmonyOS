import { rcp } from "@kit.RemoteCommunicationKit";

export class RCPUtils {
  private _baseUrl: string = ''; //AppStorage.get<string>('serverUrl') as string;

  private _rcpSession: rcp.Session;

  private static _instance = new RCPUtils("https://immich.goodhub.cn");

  private constructor(url: string) {
    this._baseUrl = url;

    const sessionConfig: rcp.SessionConfiguration = {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + AppStorage.get<string>('accessToken') as string
      },
      // timeout: 10000, // 10 seconds timeout
    };

    this._rcpSession = rcp.createSession(sessionConfig);
  }

  // class SingletonHolder {
  //   static readonly instance = new RCPUtils("https://immich.goodhub.cn");
  // }
  //

  public static getInstance(): RCPUtils {
    return RCPUtils._instance;
  }

  baseUrl(): string {
    return this._baseUrl;
  }

  rcpSession(): rcp.Session {

    // this._rcpSession.configuration.headers = {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer ' + (globalThis as any).AppStorage.get<string>('accessToken')
    // };
    return this._rcpSession;
  }

  /**
   * The method of closing a RCP Session.
   */
  destroySession() {
    // this._rcpSession.close();
  }
}
