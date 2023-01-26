import { Component } from '@angular/core';
import { AppService } from 'src/app/services/App.service';

@Component({
  selector: 'app-main-page',
  templateUrl: './main-page.component.html',
  styleUrls: ['./main-page.component.sass'],
})
export class MainPageComponent {
  constructor(private appService: AppService) {}
  logout() {
    this.appService.logout();
  }
}
