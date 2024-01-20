import { EntityState } from '@ngrx/entity';
import * as fromRouter from '@ngrx/router-store';
import { SerializedRouterStateSnapshot } from '@ngrx/router-store';

export interface RouterState extends EntityState<SerializedRouterStateSnapshot> {
  router: fromRouter.RouterReducerState<SerializedRouterStateSnapshot>;
}
