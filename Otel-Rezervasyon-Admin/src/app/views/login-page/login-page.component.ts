import { Component } from '@angular/core';
import { OtelKullanici } from 'src/app/models/OtelKullanici';
import { AppService } from 'src/app/services/App.service';

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.sass'],
})
export class LoginPageComponent {
  newOtelKullanici = new OtelKullanici();

  constructor(private appService: AppService) {}

  login() {
    this.appService.login(this.newOtelKullanici);
  }
}
