import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ColorsManagerComponent } from './pages/colors-manager/colors-manager.component';


const routes: Routes = [
  {
    path: '**',
    component: ColorsManagerComponent
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { useHash: false })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
