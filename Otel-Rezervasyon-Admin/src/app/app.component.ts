import { Component, OnInit } from '@angular/core';
import { AppService } from './services/App.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass'],
})
export class AppComponent implements OnInit {
  title = 'Otel-Rezervasyon-Admin';
  constructor(private appService: AppService) {}
  ngOnInit(): void {
    this.appService.isAuthanticated();
  }
}
