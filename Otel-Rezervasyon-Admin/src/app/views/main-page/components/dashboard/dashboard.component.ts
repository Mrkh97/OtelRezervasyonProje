import { animate, style, transition, trigger } from '@angular/animations';
import { Component, OnInit } from '@angular/core';
import { Il } from 'src/app/models/Il';
import { Otel } from 'src/app/models/Otel';
import { AppService } from 'src/app/services/App.service';

@Component({
  selector: 'app-dashboard',
  animations: [
    trigger('openClose', [
      transition(':enter', [
        style({ opacity: 0.5 }),
        animate('100ms', style({ opacity: 1 })),
      ]),
      transition(':leave', [animate('100ms', style({ opacity: 0 }))]),
    ]),
  ],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.sass'],
})
export class DashboardComponent implements OnInit {
  newOtel = new Otel();

  imageUploadModalIsOpen = false;

  iller = this.appService.iller;
  constructor(private appService: AppService) {
    appService.otel.subscribe((otel) => {
      this.newOtel = otel;
    });
  }
  ngOnInit(): void {
    this.appService.getIller();
  }

  toggleImageUploadModal() {
    this.imageUploadModalIsOpen = !this.imageUploadModalIsOpen;
  }

  updateOtel() {
    this.appService.updateOtel(this.newOtel);
  }

  deleteImg(imgId: String) {
    this.appService.deleteImg(imgId);
  }
}
