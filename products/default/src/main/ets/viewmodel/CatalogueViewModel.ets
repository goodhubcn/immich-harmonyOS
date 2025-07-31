import * as RouteConstants from '../constants/RouteConstants';
import { CatalogueItemData } from './CatalogueItemData';

/**
 * Catalogue list page view model.
 */
class CatalogueViewModel {
  /**
   * Get Catalogue data.
   *
   * @return {Array<CatalogueItemData>} CatalogueData.
   */
  getCatalogueData(): CatalogueItemData[] {
    const catalogueData: CatalogueItemData[] =
      [new CatalogueItemData(0, $r('app.string.responsive_layout'), RouteConstants.RESPONSIVE_ROUTE),
        new CatalogueItemData(1, $r('app.string.adaptive_layout'), RouteConstants.ADAPTIVE_ROUTE),
        new CatalogueItemData(2, $r('app.string.system_cap'), RouteConstants.SYSTEM_CAPABILITIES_ROUTE)];
    return catalogueData;
  }
}

const catalogueViewModel = new CatalogueViewModel();

export default catalogueViewModel;