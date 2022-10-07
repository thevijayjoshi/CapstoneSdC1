import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { JwtResponse } from 'src/app/response/JwtResponse';
import { CartService } from 'src/app/services/cart.service';
import { ProductService } from 'src/app/services/product.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-cardindesc',
  templateUrl: './cardindesc.component.html',
  styleUrls: ['./cardindesc.component.css']
})
export class CardindescComponent implements OnInit {
  title: string;
  page: any;
  constructor(private productService: ProductService,
    private route: ActivatedRoute,
    private userService:UserService,
    private cartService: CartService,
    private router:Router) { 
      this.userSubscription = this.userService.currentUser.subscribe(user => this.currentUser = user);
    }
    currentUser: JwtResponse;
    userSubscription: Subscription;
    private paramSub: Subscription;
  private querySub: Subscription;
  searchTerm:String = "";

  ngOnInit() {
    this.querySub = this.route.queryParams.subscribe(() => {
      this.update();
    });
    this.paramSub = this.route.params.subscribe(() => {
      this.update();
    });
  }
  update() {
    if (this.route.snapshot.queryParamMap.get('page')) {
      const currentPage = +this.route.snapshot.queryParamMap.get('page');
      const size = +this.route.snapshot.queryParamMap.get('size');
      this.getProdsdesc(currentPage, size);
    } else {
      this.getProdsdesc();
    }
  }

  getProdsdesc(page: number = 1, size: number = 20){
    this.productService.getAllInPageDesc(+page, +size)
        .subscribe(page => {
          this.page = page;
          this.title = 'Home Décor';
        });
  }

  ngOnDestroy(): void {
    this.querySub.unsubscribe();
    this.paramSub.unsubscribe();
  }
}
