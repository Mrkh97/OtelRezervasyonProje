import { Kullanici } from './Kullanici';
import { Otel } from './Otel';

export class Rezervasyon {
  giris_tarihi?: Date;
  cikis_tarihi?: Date;
  toplam_fiyat?: number;
  bekleyen?: boolean;
  date_created_at?: Date;
  otel?: Otel;
  kullanici?: Kullanici;
}
