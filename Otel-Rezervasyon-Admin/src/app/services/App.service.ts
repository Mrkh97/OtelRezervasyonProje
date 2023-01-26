import { HttpClient } from '@angular/common/http';
import { Injectable, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';
import { enviroment } from 'src/environments/enviroment';
import { Il } from '../models/Il';
import { Otel } from '../models/Otel';
import { OtelKullanici } from '../models/OtelKullanici';
import { Rezervasyon } from '../models/Rezervasyon';

@Injectable({ providedIn: 'root' })
export class AppService {
  kullanici = new BehaviorSubject<OtelKullanici>(new OtelKullanici());
  iller = new BehaviorSubject<[Il]>([new Il()]);
  otel = new BehaviorSubject<Otel>(new Otel());
  rezervasyonlar = new BehaviorSubject<[Rezervasyon]>([new Rezervasyon()]);

  constructor(private http: HttpClient, private router: Router) {}

  login(otelKullanici: OtelKullanici) {
    this.http
      .post(`${enviroment.api}/OtelKullanici/getOtelKullanici`, otelKullanici)
      .subscribe((res: any) => {
        if (res.durum) {
          console.log(res);
          this.kullanici.next(res.data);
          this.otel.next(res.data.otel);
          localStorage.setItem('user', JSON.stringify(res.data));
          localStorage.setItem('otel', JSON.stringify(res.data.otel));
          this.router.navigate(['main', 'dashboard']);
        } else {
        }
      });
  }

  signup(otelKullanici: OtelKullanici) {
    this.http
      .post(`${enviroment.api}/OtelKullanici/addOtelKullanici`, otelKullanici)
      .subscribe((res) => {
        console.log(res);
        this.router.navigate(['login']);
      });
  }

  logout() {
    localStorage.removeItem('user');
    this.router.navigate(['login']);
  }

  isAuthanticated() {
    const user = localStorage.getItem('user');
    const otel = localStorage.getItem('otel');
    if (user != null && otel != null) {
      this.kullanici.next(JSON.parse(user));
      this.otel.next(JSON.parse(otel));
    }
  }

  updateOtel(otel: Otel) {
    this.http
      .post(`${enviroment.api}/Otel/updateOtel`, otel)
      .subscribe((res) => console.log(res));
  }

  getOtel() {
    this.http
      .post(`${enviroment.api}/Otel/getOtel`, { otel: this.otel.value._id! })
      .subscribe((res: any) => {
        if (res.durum) {
          this.otel.next(res.data);
          localStorage.setItem('otel', JSON.stringify(res.data));
        }
      });
  }

  getRezervasyonList() {
    this.http
      .post(`${enviroment.api}/Rezervasyon/getRezervasyonListOtel`, {
        otel: this.otel.value._id,
      })
      .subscribe((res: any) => {
        this.rezervasyonlar.next(res.data);
        console.log(this.rezervasyonlar.value);
      });
  }

  getIller() {
    this.http.get(`${enviroment.api}/Il/getIller`).subscribe((res: any) => {
      this.iller.next(res.data);
    });
  }

  uploadImg(file: File) {
    const formData = new FormData();
    console.log(file);
    formData.append('otel', this.kullanici.getValue().otel!._id!.toString());
    formData.append('image', file, file.name);
    this.http
      .post(`${enviroment.api}/uploadImg`, formData)
      .subscribe(() => this.getOtel());
  }

  deleteImg(imgId: String) {
    this.http
      .post(`${enviroment.api}/removeImg`, {
        otelId: this.otel.value._id,
        imgId: imgId,
      })
      .subscribe(() => {
        this.getOtel();
      });
  }
}
