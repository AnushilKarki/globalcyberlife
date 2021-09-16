
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">

<!-- font awesome cdn link  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet" href="/css/navbar.css">
<link rel="stylesheet" href="/css/home.css">
<link rel="stylesheet" href="/css/footer.css">
<!-- custom css file link  -->
<link rel="stylesheet" href="/css/styleHome.css">

<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">

<!-- Box icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />

<!-- Custom StyleSheet -->
<link rel="stylesheet" href="/css/styles.css" />

<link rel="stylesheet" href="/css/chat.css"/>
<link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/lightslider.css">
    <style>
.cont {
  height: 40px;
  position: relative;
  border: 3px solid green;
}

.center {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.topofnav{
  width:100%;
  height:5%;

  background-color : #f2f2f2;
}

ul#menu1 li {
  display:inline;
text-align : center;
} 
.homebody{
  height:100%;
  width:100%;
}
 .full{
  height:80%;
  width:100%;
  margin-left : 40px;
  margin-right:20px;
  margin-top : 10px;
  
}

/*social icons styling starts*/
.social {
  position: fixed;
  height: 80vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  color: white;
  transform: translate(-260px, 0);
  z-index: 1;
}
.social a {
  background: rgba(0, 0, 0, 0.4);
  text-decoration: none;
  text-transform: capitalize;
  display: block;
  margin: 5px;
  width: 300px;
  text-align: right;
  margin-left: 0;
  padding: 15px;
  border-radius: 50px;
  transition: 1s;
  transition-property: transform;
  color: aliceblue;
  font-size: 20px;
}
.social a:hover {
  transform: translate(140px, 10px);
}
.social i {
  margin-left: 10px;
  font-size: 20px;
  width: 20px;
  height: 20px;
}
.social a:nth-child(1) i {
  color: #4267b2;
}
.social a:nth-child(2) i {
  color: #8a3ab9;
}
.social a:nth-child(3) i {
  color: #1da1f2;
}
.social a:nth-child(4) i {
  color: #ff0000;
}

</style>
    <title>Menu</title>
</head>
<body>

<!-- Navbar Section -->
<header id="home">

    <div class="nav-container">
  
   <div class="menu">
   <div class="topofnav">

<ul id="menu1">
  <li><h3>Franchise Oppertunity!!! call : 9843777683 </h3></li>


</ul>  

</div>
  <!--   social icons   starts-->
    
  <div class="social">
      <a href="">facebook<i class="fab fa-facebook" aria-hidden="true"></i></a>
      <a href="">instagram<i class="fab fa-instagram" aria-hidden="true"></i></a>
      <a href="">twitter<i class="fab fa-twitter" aria-hidden="true"></i></a>
      <a href="">youtube<i class="fab fa-youtube" aria-hidden="true"></i></a>
    </div>
    
    
    
    <!--   social icons  ends-->
       <nav>
         
           <input type="checkbox" id="show-search">
           <input type="checkbox" id="show-menu">
           <label for="show-menu" class="menu-icon"><i class="fas fa-bars    "></i></label>
       <div class="menu-items">
       <div class="logo">
         
           <a href="#">
                        <img id="logo" src="/images/logo3.png">
                    </a>
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
        <li>
            <a href="#" class="desktop-links">Gift</a>
            <input type="checkbox" id="show-features">
            <label for="show-features">Gift</label>
            <ul>                    @foreach($gifts as $gift)
                <li>  <a href="{{ route('gifts.index',$gift->id) }}">{{ $gift->particular }}</a></li>
@endforeach

               
            </ul>
        </li>
           <li><a href="/delivery">Delivery office</a></li>
           <li><a href="#">Help & Feedback</a></li>
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

<section class="section featured" >
<div class="top container">


   <img src="/images/frontb.jpg" alt="" />

</div>
</section>

</header>


   <!-- End Navbar -->


 
   <!-- Start New Arrival -->

 

   <section class="section featured">
 
      <div class="product-center container">
          @foreach($arrivals as $arrival)
        <div class="product">
          
          <div class="product-header">
            <img src="{{asset('storage/'.$arrival->image)}}" alt="">
            <ul class="icons">
              <span><i class="bx bx-heart"></i></span>
            <a href="#" >  <span><i class="bx bx-shopping-bag"></i></span></a>
              <span><i class="bx bx-search"></i></span>
            </ul>
          </div>
          <div class="product-footer">
            <a href="#">
              <h3>{{ $arrival->name }}</h3>
            </a>
            <div class="rating">
              <i class="bx bxs-star"></i>
              <i class="bx bxs-star"></i>
              <i class="bx bxs-star"></i>
              <i class="bx bxs-star"></i>
              <i class="bx bx-star"></i>
            </div>
            <h4 class="price">Rs {{ $arrival->selling_price }}</h4>
          </div>
          
        </div>
        @endforeach
       
</div>
    </section>

  
 <section class="section">
 <div class="title">
        <h1>SlideShow</h1>
        
      </div>
 <ul id="autoWidth" class="cs-hidden">
    @foreach($arrivals as $arrival)  <li class="item-a">
      
        <div class="box">
          <div class="slide-img">
            <div class="product">
            <img src="{{asset('storage/'.$arrival->image)}}" alt="" />
</div>
            <div class="overlay">
              <a href="#" class="buy-btn">Buy Now</a>
            </div>
          </div>
        
          <div class="detail-box">
         
            <div class="type">
              <a href="#">{{ $arrival->brand_name }}</a>
              <span>{{ $arrival->name }}</span>
            </div>
            <a href="#" class="price">Rs {{ $arrival->selling_price }}</a>
         
</div>
        </div>
      </li>
      @endforeach
    
    </ul>
</section>

    <!--Latest -->
    <section class="section featured">
      <div class="title">
        <h1>Latest Products</h1>
      </div>

      <div class="product-center container">
          @foreach($arrivals as $arrival)
        <div class="product">
          <div class="product-header">
            <img src="{{asset('storage/'.$arrival->image)}}" alt="">

            <ul class="icons">
              <span><i class="bx bx-heart"></i></span>
              <span><i class="bx bx-shopping-bag"></i></span>
              <span><i class="bx bx-search"></i></span>
            </ul>
          </div>
          <div class="product-footer">
            <a href="#"><h3>{{ $arrival->name }}</h3></a>
            <div class="rating">
              <i class="bx bxs-star"></i>
              <i class="bx bxs-star"></i>
              <i class="bx bxs-star"></i>
              <i class="bx bxs-star"></i>
              <i class="bx bx-star"></i>
            </div>
            <h4 class="price">Rs {{ $arrival->selling_price }}</h4>
          </div>
        </div>
        @endforeach
        
      </div>
    </section>
   <section class="section all-products" id="products">
        <div class="top container">
            <h1>All Products</h1>
            <form>
                <select>
                    <option value="1">Defualt Sorting</option>
                    <option value="2">Sort By Price</option>
                    <option value="3">Sort By Popularity</option>
                    <option value="4">Sort By Sale</option>
                    <option value="5">Sort By Rating</option>
                </select>
                <span><i class='bx bx-chevron-down'></i></span>
            </form>
        </div>
     
        <div class="product-center container">
            @foreach($arrivals as $arrival)
            <div class="product">
                <div class="product-header">
                    <img src="{{asset('storage/'.$arrival->image)}}" alt="">
                    <ul class="icons">
                        <span><i class="bx bx-heart"></i></span>
                        <a href="{{route('cart.add', $arrival->id)}}"> <span><i class="bx bx-shopping-bag"></i></span>
                        </a>
                        <a href="{{route('products.show', $arrival)}}" style="--i:3;">   <span><i class="bx bx-search"></i></span></a>
                    </ul>
                </div>
                <div class="product-footer">
                    <a href="product-details.html">
                        <h3>{{ $arrival->name }}</h3>
                    </a>
                    <div class="rating">
                        <i class="bx bxs-star"></i>
                        <i class="bx bxs-star"></i>
                        <i class="bx bxs-star"></i>
                        <i class="bx bxs-star"></i>
                        <i class="bx bx-star"></i>
                    </div>
                    <h4 class="price">{{ $arrival->selling_price }}</h4>
                </div>
            </div>
            @endforeach
          
        </div>
    </section>

    <section class="pagination">
        <div class=" container">
            <span>1</span>
            <span>2</span>
            <span>3</span>
            <span>4</span>
            <span><i class='bx bx-right-arrow-alt'></i></span>
        </div>
    </section>


   <!-- End  New Arrival -->

   <!-- Product Section -->

     <!-- Product Banner -->
  
     <section class="section">
      <div class="product-banner">
        <div class="left">
          <img src="/images/bg.jpg" alt="" />
        </div>
        <div class="right">
          <div class="content">
            <h2><span class="discount">70% </span> SALE OFF</h2>
            <h1>
              <span>Collect Your</span>
              <span>Kids Collection</span>
            </h1>
            <a class="btn" href="#">shop now</a>
          </div>
        </div>
      </div>
    </section>
    <!-- Testimonials -->
    <section class="section">
      <div class="testimonial-center container">
        <div class="testimonial">
          <span>&ldquo;</span>
          <p>
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis,
            fugiat labore. Veritatis et omnis consequatur.
          </p>
          <div class="rating">
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bx-star"></i>
          </div>
          <div class="img-cover">
            <img src="./images/profile1.jpg" alt="" />
          </div>
          <h4>Will Smith</h4>
        </div>
        <div class="testimonial">
          <span>&ldquo;</span>
          <p>
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis,
            fugiat labore. Veritatis et omnis consequatur.
          </p>
          <div class="rating">
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bx-star"></i>
          </div>
          <div class="img-cover">
            <img src="./images/profile2.jpg" alt="" />
          </div>
          <h4>Will Smith</h4>
        </div>
        <div class="testimonial">
          <span>&ldquo;</span>
          <p>
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis,
            fugiat labore. Veritatis et omnis consequatur.
          </p>
          <div class="rating">
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bx-star"></i>
          </div>
          <div class="img-cover">
            <img src="./images/profile3.jpg" alt="" />
          </div>
          <h4>Will Smith</h4>
        </div>
      </div>
    </section>

    <!-- Brands -->
    <section class="section">
      <div class="brands-center container">
        <div class="brand">
          <img src="./images/brand1.png" alt="" />
        </div>
        <div class="brand">
          <img src="./images/brand2.png" alt="" />
        </div>
        <div class="brand">
          <img src="./images/brand1.png" alt="" />
        </div>
        <div class="brand">
          <img src="./images/brand2.png" alt="" />
        </div>
        <div class="brand">
          <img src="./images/brand1.png" alt="" />
        </div>
        <div class="brand">
          <img src="./images/brand2.png" alt="" />
        </div>
      </div>

    </section>
    <!-- End Product Section -->

    <!-- deal section starts  -->
    
  <!-- CHAT BAR BLOCK -->
  <div class="chat-bar-collapsible">
    <button id="chat-button" type="button" class="collapsible">Cyberlife sathi!
      <i id="chat-icon" style="color: #fff;" class="fa fa-fw fa-comments-o"></i>
    </button>
  
    <div class="content">
      <div class="full-chat-block">
        <!-- Message Container -->
        <div class="outer-container">
          <div class="chat-container">
            <!-- Messages -->
            <div id="chatbox">
              <h5 id="chat-timestamp"></h5>
              <p id="botStarterMessage" class="botText"><span>Loading...</span></p>
            </div>
  
            <!-- User input box -->
            <div class="chat-bar-input-block">
              <div id="userInput">
                <input id="textInput" class="input-box" type="text" name="msg"
                  placeholder="Enter no to choose service">
                <p></p>
              </div>
  
              <div class="chat-bar-icons">
                <i id="chat-icon" style="color: crimson;" class="fa fa-fw fa-heart" onclick="heartButton()"></i>
                <i id="chat-icon" style="color: #333;" class="fa fa-fw fa-send" onclick="sendButton()"></i>
              </div>
            </div>
  
            <div id="chat-bar-bottom">
              <p></p>
            </div>
  
          </div>
        </div>
  
      </div>
    </div>
  
  </div>
  <!--chat bar ends-->


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
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
  <!-- Custom Script -->
  <script src="/js/index.js"></script>
<script type="text/javascript" src="/js/chat.js"></script>
  <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/lightslider.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
  <script>
    
  </script>

</body>
</html>