import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { admin } from 'src/app/models/admin';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-adminsignup',
  templateUrl: './adminsignup.component.html',
  styleUrls: ['./adminsignup.component.css']
})
export class AdminsignupComponent implements OnInit {

  admin:admin;
  constructor(
    private userService: UserService,
    private router: Router) { 
      this.admin=new admin();
    }

  ngOnInit() {
  }

  onSubmit() {
    this.userService.signUp(this.admin).subscribe(u => {
      this.router.navigate(['/login']);
    },
        e => {});
  }
}
