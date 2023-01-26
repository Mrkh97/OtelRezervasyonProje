import { Component, EventEmitter, Output } from '@angular/core';
import { AppService } from 'src/app/services/App.service';

@Component({
  selector: 'app-image-upload-modal',
  templateUrl: './image-upload-modal.component.html',
  styleUrls: ['./image-upload-modal.component.sass'],
})
export class ImageUploadModalComponent {
  @Output() toggleModal = new EventEmitter();
  img?: File;

  constructor(private appService: AppService) {}

  onSelect(event: any) {
    this.img = event.target.files[0];
  }

  uploadImg() {
    this.appService.uploadImg(this.img!);
    this.toggleModal.emit();
  }
}
