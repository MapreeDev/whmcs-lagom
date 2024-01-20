import * as fromRouter from '@ngrx/router-store';
import { SerializedRouterStateSnapshot } from '@ngrx/router-store';
import { createSelector, createFeatureSelector } from '@ngrx/store';

export interface State {
  router: fromRouter.RouterReducerState<SerializedRouterStateSnapshot>;
}

export const selectRouterState = createFeatureSelector<
  State,
  fromRouter.RouterReducerState<SerializedRouterStateSnapshot>
  >(fromRouter.DEFAULT_ROUTER_FEATURENAME);

export const {
  selectCurrentRoute,   // select the current route
  selectFragment,       // select the current route fragment
  selectQueryParams,    // select the current route query params
  selectQueryParam,     // factory function to select a query param
  selectRouteParams,    // select the current route params
  selectRouteParam,     // factory function to select a route param
  selectRouteData,      // select the current route data
  selectUrl,            // select the current url
} = fromRouter.getSelectors(selectRouterState);

export const selectParams = createSelector(
  selectRouteParams,
  (params) => params
);

export const selectIdParam = createSelector(
  selectRouteParams,
  (params) => params?.id
);

export const selectLayoutType = createSelector(
  selectRouteData,
  (data) => data?.layout
);
