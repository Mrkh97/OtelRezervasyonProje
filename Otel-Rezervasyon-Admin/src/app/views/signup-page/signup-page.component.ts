import { Component } from '@angular/core';
import { OtelKullanici } from 'src/app/models/OtelKullanici';
import { AppService } from 'src/app/services/App.service';

@Component({
  selector: 'app-signup-page',
  templateUrl: './signup-page.component.html',
  styleUrls: ['./signup-page.component.sass'],
})
export class SignupPageComponent {
  newOtelKullanici = new OtelKullanici();

  constructor(private appService: AppService) {}

  signup() {
    this.appService.signup(this.newOtelKullanici);
  }
}
