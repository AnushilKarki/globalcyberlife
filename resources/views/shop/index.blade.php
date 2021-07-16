<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Project</title>

    <!-- owl carousel css file cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/css/styleHome.css">

</head>
<style>
    
.zoom-img {
  width: 300px;
  height: 200px;
  overflow: hidden;
}

.zoom-img > img {  
  object-fit: cover;
	width: 100%;
	height: 100%;
  transition: all .3s ease-in-out;
}

.zoom-img:hover > img {
  transform: scale(1.2);
}
    .dropbtn {
  background-color:linear-gradient(var(--blue), blueviolet);
  color: rgb(240, 240, 240);
  padding: 16px;
  font-size: 16px;
  border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: fixed;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #1d599182;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: #1d599182;}
</style>
<body>

<!-- header section starts  -->



<header>

<div class="header-1">

    <a href="#" class="logo"> <i class="fas fa-shopping-bag"></i>  MUlti-shop </a>

    <div class="form-container">
    
        <form action="{{route('products.search')}}" method="GET">
                            <input name="query" placeholder="search products" type="search" id="search">
                          
                            <button type="submit" for="search" class="fas fa-search"> </button>
                        </form>
                     

    </div>

</div>

<div class="header-2">

    <div id="menu" class="fas fa-bars"></div>

    <nav class="navbar" id="dropdown">
        <ul>
        
              @foreach($categories as $category)
              <div class="dropdown">
               
             <a href="{{route('products.index', ['category_id' => $category->id])}}"> <button class="dropbtn">{{ $category->name }}</button></a> 
                <div class="dropdown-content">
                    <?php
                    $childs = TCG\Voyager\Models\Category::where('parent_id', $category->id)->get();
                ?>
                @if($childs->isNotEmpty())
@foreach($childs as $child)
                  <a href="#">{{ $child->name }}</a>
                 
                  <?php
           $grandChild = TCG\Voyager\Models\Category::where('parent_id', $child->id)->get();
       ?>
        
      


       @if($grandChild->isNotEmpty())
                  <div class="dropdown">
                    
                   
                    <div class="dropdown-content">
                        @foreach($grandChild as $grand)
                      <a href="#">{{ $grand->name }}</a>

    @endforeach
    @endif


                    
                    </div>
                  </div> 
         
                  @endforeach    @endif
                </div>
              </div> 
              @endforeach 
        
          
          
          
        </ul>
    </nav>

    <div class="icons">
        <a href="#" class="fas fa-heart"></a>
        <a href="{{ route('cart.index') }}" class="fas fa-shopping-cart"></a>
        <a href="{{ route('login') }}" class="fas fa-user"></a>
    </div>

</div>

</header>

<!-- header section ends -->

<!-- home section starts  -->



<!-- home section ends -->

<!-- arrival section starts  -->

<section class="arrival" id="arrival">

<h1 class="heading"> <span>@foreach($shops as $shop)
    {{ $shop->name }} new arrivals</span> </h1>
@endforeach
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
            <a class="fas fa-shopping-cart" href="{{route('cart.add', $arrival->id)}}">add to cart</a>
            <a href="{{route('products.show', $arrival)}}" style="--i:3;" class="fas fa-search"></a>
        </div>
    </div>
@endforeach
</div>

</section>

<!-- arrival section ends -->


<section class="feature" id="featured">

<h1 class="heading"> <span> featured product </span> </h1>
@foreach ($feature as $product)
<div class="row">

    <div class="image-container">

        <div class="big-image">
        <img src="{{asset('storage/'.$product->image)}}" class="img-responsive">
        </div>


        @if($product->product_images != null)
     @foreach(json_decode($product->product_images) as $images)
        <div class="small-image">
            <img src="{{ Voyager::image( $images ) }}" alt="">
    
        </div>
     @endforeach
     @endif
    </div>

    <div class="content">

        <h3>{{$product->name}}</h3>
        <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <span>Rating</span>
        </div>
        <p>{{ $product->description }}</p>
        <strong class="price">{{ $product->selling_price }}<span>{{ $product->selling_price }}</span> </strong>
        <a class="fas fa-shopping-cart" href="{{route('cart.add', $product->id)}}"><button class="btn">add to cart</button></a>

    </div>

</div>
@endforeach
</section>


<!-- featured section ends -->

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
<!-- gallery section ends -->

<!-- deal section starts  -->

<section class="deal" id="deal">

<h1 class="heading">  </h1>

<div class="box-container">
@foreach($advertisements as $advertisement)
    <div class="box">
    <img src="{{asset('storage/'.$advertisement->image)}}" >
        <div class="content">
            <h3>{{ $advertisement->particular }}</h3>
            <p>{{ $advertisement->type }}</p>
            <a href="#"><button class="btn">explore</button></a>
        </div>
    </div>
@endforeach
   

</div>

<div class="icons-container">

    <div class="icons">
        <i class="fas fa-shipping-fast"></i>
        <h3>fast delivery</h3>
        <p>fastet delivery possible</p>
    </div>

    <div class="icons">
        <i class="fas fa-user-clock"></i>
        <h3>24 x 7 support</h3>
        <p>24 hour customer support</p>
    </div>

    <div class="icons">
        <i class="fas fa-money-check-alt"></i>
        <h3>easy payments</h3>
        <p>cash on delivery available</p>
    </div>

    <div class="icons">
        <i class="fas fa-box"></i>
        <h3>10 days replacements</h3>
        <p>get replacement policy</p>
    </div>

</div>

</section>

<!-- deal section ends -->

<!-- newsletter section starts  -->

<section class="newsletter">

    <h1>newsletter</h1>
    <p>get in touch for latest discounts and updates</p>
    <form method="post" action="{{ route('newsletter.store',<?php auth()->id() ?>) }}">
    @csrf
        <input type="email" placeholder="enter your email">
        <input type="submit" class="btn">
    </form>

</section>

<!-- newsletter section ends -->

<!-- footer section starts  -->

<section class="footer">

    <div class="box-container">

        <div class="box">
            <a href="#" class="logo"> <i class="fas fa-shopping-bag"></i>  shopping </a>
            <p>For your greater shopping experience.</p>
        </div>

        <div class="box">
            <h3>links</h3>
            <a href="#">home</a>
            <a href="#">arrival</a>
            <a href="#">featured</a>
            <a href="#">gallery</a>
            <a href="#">deal</a>
        </div>

        <div class="box">
            <h3>contact us</h3>
            <p> <i class="fas fa-home"></i>
              kaushaltar,bhaktapur
           
            </p>
            <p> <i class="fas fa-phone"></i>
            9843777683
            </p>
            <p> <i class="fas fa-globe"></i>
               globalcyberlife.com
            </p>
        </div>

    </div>

<h1 class="credit">college project </h1>

</section>

<!-- footer section ends -->











<!-- jquery cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- owl carousel js file cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<!-- custom js file link  -->
<script src="js/home.js"></script>
    
</body>
</html>