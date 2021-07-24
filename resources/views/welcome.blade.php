
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/footer.css">
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
           <li><a href="/home">Home</a></li>
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

   <div class="body-container">
    <section class="arrival" id="arrival">

        <h1 class="heading"> <span>new arrivals</span> </h1>
        
        <div class="box-container">
        
        @foreach($arrivals as $arrival)


<div class="box">
    <div class="image">
    <img src="{{asset('storage/'.$arrival->image)}}" class="img-responsive">
    </div>
    <div class="info">
        <h3>{{ $arrival->name }}</h3>
        <div class="subInfo">
            <strong class="price"> {{ $arrival->selling_price }} </strong>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half"></i>
            </div>
        </div>
    </div>
    <div class="overlay">
        <a href="#" style="--i:1;" class="fas fa-heart"></a>
        <a class="fas fa-shopping-cart" href="{{route('cart.add', $arrival->id)}}"></a>
        <a href="{{route('products.show', $arrival)}}" style="--i:3;" class="fas fa-search"></a>
    </div>
</div>
@endforeach
            
        </div>
        
        </section>
   </div>

   <!-- End  New Arrival -->

   <!-- Product Section -->

   
<section class="gallery" id="gallery">

<h1 class="heading"> <span> product gallery </span> </h1>

<ul class="controls">
    <li class="btn button-active" data-filter="all">all</li>
    <li class="btn" data-filter="phone">Hemp</li>
    <li class="btn" data-filter="laptop">Folding Item</li>
    <li class="btn" data-filter="headphone">Cultural Product</li>
    <li class="btn" data-filter="shoes">Cosmetics</li>
</ul>

<div class="image-container">
@foreach($hemps as $product)
    <div class="box phone">
        <div class="image">
           <a href="{{route('products.show', $product->id)}}">  
        <img src="{{asset('storage/'.$product->image)}}" >
        </a>
        </div>
        <div class="info">
              <h3>{{ $product->name }}</h3>
            <div class="subInfo">
                <strong class="price">{{ $product->selling_price }}</strong>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
            </div>
        </div>
    </div>
@endforeach
   
@foreach($foldings as $product)
    <div class="box laptop">
       <div class="image">
            
 <a href="{{route('products.show', $product->id)}}">  
        <img src="{{asset('storage/'.$product->image)}}" >
        </a>
        </div>
        <div class="info">
            <h3>{{ $product->name }}</h3>
            <div class="subInfo">
                <strong class="price">{{ $product->selling_price }}</strong>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
            </div>
        </div>
    </div>
@endforeach
@foreach($cosmetics as $product)
    <div class="box shoes">
       <div class="image">
            
        <a href="{{route('products.show', $product->id)}}">  
        <img src="{{asset('storage/'.$product->image)}}" >
        </a>
        </div>
        <div class="info">
            <h3>{{ $product->name }}</h3>
            <div class="subInfo">
                <strong class="price">{{ $product->selling_price }}</strong>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
            </div>
        </div>
    </div>
@endforeach
   
@foreach($culturals as $product)
    <div class="box headphone">
       <div class="image">
            
       <a href="{{route('products.show', $product->id)}}">  
        <img src="{{asset('storage/'.$product->image)}}" >
        </a>
        </div>
        <div class="info">
            <h3>{{ $product->name }}</h3>
            <div class="subInfo">
                <strong class="price">{{ $product->selling_price }}</strong>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
            </div>
        </div>
    </div>  
@endforeach
   
</div>

</section>
    <!-- End Product Section -->

    <!-- deal section starts  -->

<section class="deal" id="deal">

    <h1 class="heading"> <span> best deals </span> </h1>
    
    <div class="box-container">
    
    @foreach($advertisements as $advertisement)
    <div class="box">
    <img src="{{asset('storage/'.$advertisement->image)}}" >
        <div class="content">
            <h3>{{ $advertisement->particular }}</h3>
            <p>{{ $advertisement->type }}</p>
         
        </div>
    </div>
@endforeach
    
      
    
        
    
    </div>
    
    
    </section>

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
<script src="js/home.js"></script>

</body>
</html>