import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/App.service';

@Component({
  selector: 'app-rezervasyonlar',
  templateUrl: './rezervasyonlar.component.html',
  styleUrls: ['./rezervasyonlar.component.sass'],
})
export class RezervasyonlarComponent implements OnInit {
  rezervasyonlar = this.appService.rezervasyonlar;
  constructor(private appService: AppService) {}
  ngOnInit(): void {
    this.appService.getRezervasyonList();
  }
}
