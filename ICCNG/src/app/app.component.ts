import { Component } from '@angular/core';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'ICCNG';
  ngOnInit() {
    console.log("mla url: ",environment.mla_service_url);
    const apiUrl = (window as any).env.mla_service_url;
    console.log("mla url: ",apiUrl);


  }
}
