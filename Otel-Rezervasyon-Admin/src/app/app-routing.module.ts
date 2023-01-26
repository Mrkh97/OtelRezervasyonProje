import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginPageComponent } from './views/login-page/login-page.component';
import { DashboardComponent } from './views/main-page/components/dashboard/dashboard.component';
import { RezervasyonlarComponent } from './views/main-page/components/rezervasyonlar/rezervasyonlar.component';
import { MainPageComponent } from './views/main-page/main-page.component';
import { SignupPageComponent } from './views/signup-page/signup-page.component';

const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  {
    path: 'login',
    component: LoginPageComponent,
  },
  {
    path: 'signup',
    component: SignupPageComponent,
  },
  {
    path: 'main',
    component: MainPageComponent,
    children: [
      { path: 'dashboard', component: DashboardComponent },
      { path: 'rezervasyonlar', component: RezervasyonlarComponent },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
