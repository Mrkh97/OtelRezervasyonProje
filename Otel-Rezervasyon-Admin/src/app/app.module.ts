import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginPageComponent } from './views/login-page/login-page.component';
import { SignupPageComponent } from './views/signup-page/signup-page.component';
import { MainPageComponent } from './views/main-page/main-page.component';
import { DashboardComponent } from './views/main-page/components/dashboard/dashboard.component';
import { RezervasyonlarComponent } from './views/main-page/components/rezervasyonlar/rezervasyonlar.component';
import { ImageUploadModalComponent } from './views/main-page/components/dashboard/components/image-upload-modal/image-upload-modal.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginPageComponent,
    SignupPageComponent,
    MainPageComponent,
    DashboardComponent,
    RezervasyonlarComponent,
    ImageUploadModalComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    BrowserAnimationsModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
