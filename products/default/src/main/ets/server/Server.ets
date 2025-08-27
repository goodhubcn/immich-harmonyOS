export interface Server {

  /**
   * GET /server/about
   *
   *curl -L '/api/server/about' \
   -H 'Accept: application/json'
   *
   *
   * */
  getAboutInfo(): Promise<void>;

  /**
   * GET /server/version-history
   *
   * curl -L '/api/server/version-history' \
   -H 'Accept: application/json'
   *
   *
   * */
  getVersionHistory(): Promise<void>;

}