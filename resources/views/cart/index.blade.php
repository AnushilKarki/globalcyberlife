



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/navbar.css">
	<link rel="stylesheet" href="/css/cart.css">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script src="https://kit.fontawesome.com/cb0aac7562.js" crossorigin="anonymous"></script>
    <title>Menu</title>
</head>
<body>

<!-- Navbar Section -->

    <div class="nav-container">

   <div class="menu">
       <nav>
           <input type="checkbox" id="show-search">
           <input type="checkbox" id="show-menu">
           <label for="show-menu" class="menu-icon"><i class="fas fa-bars    "></i></label>
       <div class="menu-items">
       <div class="logo">
           <a href="home.html">E-com</a>
       </div>
       <ul class="menu-links">
           <li><a href="home.html">Home</a></li>
           <li>
            <a href="#" class="desktop-links">Shop</a>
            <input type="checkbox" id="show-features">
            <label for="show-features">Shop</label>
            <ul>                    @foreach($shops as $shop)
                <li>  <a href="{{ route('shops.show',$shop->id) }}">{{ $shop->name }}</a></li>
@endforeach

               
            </ul>
        </li>
        <li>
            <a href="#" class="desktop-links">categoriess</a>
            <input type="checkbox" id="show-products">
            <label for="show-products">categoriess</label>
            <ul>
                @foreach($categories as $category)
            
         
                <li>
                    <a href="{{route('products.index', ['category_id' => $category->id])}}" class="desktop-links">{{ $category->name }}</a>
                    <input type="checkbox" id="show-mens">
                    <label for="show-mens">{{ $category->name }}</label>
                    
                    @php
                                        $children = TCG\Voyager\Models\Category::where('parent_id', $category->id)->get();
                                    @endphp

                               @if($children->isNotEmpty())
                    <ul>
                        @foreach($children as $child)
                        <li><a href="{{route('products.index', ['category_id' => $child->id])}}">{{$child->name}}</a></li>
                       @endforeach
                    </ul>
                    @endif
                </li>
                @endforeach
                
            </ul>
        </li>
           <li><a href="#">About US</a></li>
           <li><a href="#">Feedback</a></li>
       </ul>
    </div>
    <a href="{{ route('cart.index') }}" class="menu-search"><i class="fas fa-shopping-cart"></i></a>
    <label for="show-search" class="menu-search"><i class="fas fa-search    "></i></label>
    <form action="{{route('products.search')}}" class="search-box">
        <input type="text" placeholder="Type Something to Search" required>
        <button type="submit" class="go-icon"><i class="fas fa-long-arrow-alt-right    "></i></button>
    </form>
  
    </nav>
   </div>
    
</div>

   <!-- End Navbar -->

   <!-- Start New Arrival -->

   <div class="container">

        <h1>Shopping Cart</h1>
    
        <div class="cart">
    
            <div class="products">
    @foreach($cartitems as $item)
                <div class="product">
         
				@php
                                        $photo = App\Models\Product::where('id', $item->id)->value('image');
                                    @endphp
                  
					<img src="{{asset('storage/'.$photo)}}" >
    
                    <div class="product-info">
    
                        <h3 class="product-name">{{ $item->name }}</h3>
    
                        <h4 class="product-price">{{ $item->price }}</h4>
    
                        <h4 class="product-offer">50%</h4>
    

						<form action="{{route('cart.update',$item->id)}}">
							@csrf
<input name="quan" type="number" value="{{ $item->quantity }}">
<input type="submit" value="save">
</form>
    
                        <p class="product-remove">
    
                            <i class="fa fa-trash" aria-hidden="true"></i>
    
							<a href="{{ route('cart.destroy',$item->id) }}"> <span class="remove">Remove</span></a>
						
    
                        </p>
    
                    </div>
    
                </div>
    @endforeach
                
    
            </div>
    
            <div class="cart-total">
    
                <p>
    
                    <span>Total Price</span>
    
                    <span> {{ \Cart::session(auth()->id())->getTotal()  }}</span>
    
                </p>
    
                <p>
    
                    <span>Number of Items</span>
    
                    <span>{{ \Cart::session(auth()->id())->getContent()->count() }}</span>
    
                </p>
    
                <p>
    
                    <span>You Save</span>
    
                    <span>₹ 1,000</span>
    
                </p>
    

				<a href="{{ route('cart.checkout') }}">Checkout</a>

            </div>
    
        </div>
    
    </div>

    <!-- End Deal Section -->

    <!-- Start Footer -->

    <footer class="footer">
        <div class="footer-container">
            <div class="footer-row">
                <div class="footer-col">
                    <h4>company</h4>
                    <ul>
                        <li><a href="#">about us</a></li>
                        <li><a href="#">our services</a></li>
                        <li><a href="#">privacy policy</a></li>
                        <li><a href="#">affiliate program</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>get help</h4>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">shipping</a></li>
                        <li><a href="#">returns</a></li>
                        <li><a href="#">order status</a></li>
                        
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>online shop</h4>
                    <ul>
                        <li><a href="#">watch</a></li>
                        <li><a href="#">bag</a></li>
                        <li><a href="#">shoes</a></li>
                        <li><a href="#">dress</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>follow us</h4>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
   </footer>

   <!-- End Footer -->

    <!-- jquery cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- owl carousel js file cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<!-- custom js file link  -->
<script src="/js/home.js"></script>

</body>
</html>