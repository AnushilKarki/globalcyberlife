


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/navbar.css">
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script src="https://kit.fontawesome.com/cb0aac7562.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.css" />
  <!-- Custom StyleSheet -->
  <link rel="stylesheet" href="/css/styles.css" />
  <style>


#content-wrapper{
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
}

.column{
	width: 600px;
	padding: 10px;

}

#featured{
	max-width: 500px;
	max-height: 600px;
	object-fit: cover;
	cursor: pointer;
	border: 2px solid black;

}

.thumbnail{
	object-fit: cover;
	max-width: 180px;
	max-height: 100px;
	cursor: pointer;
	opacity: 0.5;
	margin: 5px;
	border: 2px solid black;

}

.thumbnail:hover{
	opacity:1;
}

.active{
	opacity: 1;
}

#slide-wrapper{
	max-width: 500px;
	display: flex;
	min-height: 100px;
	align-items: center;
}

#slider{
	width: 440px;
	display: flex;
	flex-wrap: nowrap;
	overflow-x: auto;

}

#slider::-webkit-scrollbar {
		width: 8px;

}

#slider::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);

}
 
#slider::-webkit-scrollbar-thumb {
  background-color: #dede2e;
  outline: 1px solid slategrey;
   border-radius: 100px;

}

#slider::-webkit-scrollbar-thumb:hover{
    background-color: #18b5ce;
}

.arrow{
	width: 30px;
	height: 30px;
	cursor: pointer;
	transition: .3s;
}

.arrow:hover{
	opacity: .5;
	width: 35px;
	height: 35px;
}
/* rating and review */

.heading {
  font-size: 25px;
  margin-right: 25px;
}

.fa {
  font-size: 25px;
}

.checked {
  color: orange;
}

/* Three column layout */
.side {
  float: left;
  width: 15%;
  margin-top: 10px;
}

.middle {
  float: left;
  width: 70%;
  margin-top: 10px;
}

/* Place text to the right */
.right {
  text-align: right;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* The bar container */
.bar-container {
  width: 100%;
  background-color: #f1f1f1;
  text-align: center;
  color: white;
}

/* Individual bars */
.bar-5 {width: 60%; height: 18px; background-color: #04AA6D;}
.bar-4 {width: 30%; height: 18px; background-color: #2196F3;}
.bar-3 {width: 10%; height: 18px; background-color: #00bcd4;}
.bar-2 {width: 4%; height: 18px; background-color: #ff9800;}
.bar-1 {width: 15%; height: 18px; background-color: #f44336;}

/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media (max-width: 400px) {
  .side, .middle {
    width: 100%;
  }
  /* Hide the right column on small screens */
  .right {
    display: none;
  }
}
  </style>
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

   <!-- End Navbar -->

   <!-- Start New Arrival -->

   <div class="body-container">

   <!-- Product Section -->


  <!-- Product Details -->@foreach($products as $product)
  @php
                                        $photo = App\Models\Product::where('id', $product->id)->value('image');
                                        $colors= App\Models\Stock::where('product_id',$product->id)->get();
                                     $reviews= App\Models\Product_review::where('product_id',$product->id)->get();
                                     $services= App\Models\ShopCustomerService::where('product_id',$product->id)->get();
                                    @endphp
  <section class="section product-detail">
    <div class="details container-md">
      <div class="left">
        <div class="big-image">
            <div class="main">
          <img src="{{asset('storage/'.$product->image)}}" alt="">
</div>
        </div>
        <div class="thumbnails">
       
     @foreach($colors as $stock)
          <div class="small-image">
              <div class="thumbnail">
            <img src="{{asset('storage/'.$stock->images)}}" alt="">
</div>
          </div>
         @endforeach
        </div>
      </div>
      <div class="right">
    
        <h1>{{ $product->name }}</h1>
        <div class="price">Rs {{ $product->selling_price }}</div>
        <form action="{{route('cart.add', $product->id)}}">
        @csrf
      
          
          <div>
          <label for="size">Select Size : </label>
            <select name="size">
              <option value="Select Size" selected disabled>Select Size</option>
              @foreach($colors as $color)
              <option value="{{ $color->size }}">{{ $color->size }}</option>
       
              @endforeach
             
            </select>
            <br><br>
            <label for="color">Select Color : </label>
            <select name="color">
              <option value="Select color" selected disabled>Select Color</option>
              @foreach($colors as $color)
              <option value="{{ $color->color }}">{{ $color->color }}</option>
       <?php  $weight=$color->weight;  ?>
              @endforeach
             
            </select>
           <br><br>
           <label for="weight">Weight : {{ $weight }}KG</label>
           <br><br>
           <label for="qty">Quantity : </label>
           <input name="weight" type="hidden" value="{{ $weight }}">
            <span><i class='bx bx-chevron-down'></i></span>
            <input name="quan" type="number" min="1" value="">
         <br><br>
         <input type="submit" class="addCart"value="Add to cart">
          </div>
   
        </form>

        <form class="form">

         
        
        </form>
        
    
      </div>
    </div>
  </section>

  <section class="section product-detail">
    <div class="details container-md">
    
     
      <div class="left">
    
      <h1>Product Specification</h1>
        <p>
        <table style="">
  <tr>
    <th>Color</th>
    <th>Size</th>
    <th>qty</th>
  </tr>
  @foreach($colors as $color)
  <tr>
    <td>{{ $color->color }}</td>
    <td>{{ $color->size }}</td>
    <td>{{ $color->quantity }}</td>
  </tr>
@endforeach
</table> 
        </p>

       
  
  </div>
  <div class="right">
    
      

       
    <h1>Product Details</h1>
    <p></p>
  
  </div>
    </div>
  </section>



  <section class="section product-detail">
    <div class="details container-md">
   
      <div class="left">
    
      

       
        <h1>Rating and Review</h1>
        <p>
          @foreach($reviews as $review)
             
          @endforeach
          
<span class="heading">User Rating</span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star"></span>
<p>4.1 average based on 254 reviews.</p>
<hr style="border:3px solid #f1f1f1">

<div class="row">
  <div class="side">
    <div>5 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-5"></div>
    </div>
  </div>
  <div class="side right">
    <div>150</div>
  </div>
  <div class="side">
    <div>4 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-4"></div>
    </div>
  </div>
  <div class="side right">
    <div>63</div>
  </div>
  <div class="side">
    <div>3 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-3"></div>
    </div>
  </div>
  <div class="side right">
    <div>15</div>
  </div>
  <div class="side">
    <div>2 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-2"></div>
    </div>
  </div>
  <div class="side right">
    <div>6</div>
  </div>
  <div class="side">
    <div>1 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-1"></div>
    </div>
  </div>
  <div class="side right">
    <div>20</div>
  </div>
</div>
        </p>
      </div>
      <div class="right">
      <h1>Product story</h1>
    <p>{{ $product->description }}</p>
</div>
    </div>
  </section>

<section class="seaction featured">

  <section class="section product-detail">
    <div class="details container-md">
    
      <div class="right">
    
      

       
        <h1>Question about this Product</h1>
        @foreach($services as $service)
        <p>
          QUESTION :{{ $service->customer_query }}
          ANSWER :  {{ $service->answer }}
        </p>
        @endforeach
      </div>
    
    </div>
  </section>
@endforeach
</section>
  <!-- Related -->
  <section class="section featured">
    <div class="top container">
      <h1>Related Products</h1>
      <a href="#" class="view-more">View more</a>
    </div>

    <div class="product-center container">
      <div class="product">
        <div class="product-header">
          <img src="./images/pic1.jpg" alt="">
          <ul class="icons">
            <span><i class="bx bx-heart"></i></span>
            <span><i class="bx bx-shopping-bag"></i></span>
            <span><i class="bx bx-search"></i></span>
          </ul>
        </div>
        <div class="product-footer">
          <a href="#"><h3>Boy’s T-Shirt</h3></a>
          <div class="rating">
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bx-star"></i>
          </div>
          <h4 class="price">$50</h4>
        </div>
      </div>
      <div class="product">
        <div class="product-header">
          <img src="./images/pic2.jpg" alt="">

          <ul class="icons">
            <span><i class="bx bx-heart"></i></span>
            <span><i class="bx bx-shopping-bag"></i></span>
            <span><i class="bx bx-search"></i></span>
          </ul>
        </div>
        <div class="product-footer">
          <a href="#"><h3>Boy’s T-Shirt</h3></a>
          <div class="rating">
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bx-star"></i>
          </div>
          <h4 class="price">$50</h4>
        </div>
      </div>
      <div class="product">
        <div class="product-header">
          <img src="./images/pic3.jpg" alt="">

          <ul class="icons">
            <span><i class="bx bx-heart"></i></span>
            <span><i class="bx bx-shopping-bag"></i></span>
            <span><i class="bx bx-search"></i></span>
          </ul>
        </div>
        <div class="product-footer">
          <a href="#"><h3>Boy’s T-Shirt</h3></a>
          <div class="rating">
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bx-star"></i>
          </div>
          <h4 class="price">$50</h4>
        </div>
      </div>
      <div class="product">
        <div class="product-header">
          <img src="./images/pic4.jpg" alt="">

          <ul class="icons">
            <span><i class="bx bx-heart"></i></span>
            <span><i class="bx bx-shopping-bag"></i></span>
            <span><i class="bx bx-search"></i></span>
          </ul>
        </div>
        <div class="product-footer">
          <a href="#"><h3>Boy’s T-Shirt</h3></a>
          <div class="rating">
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bxs-star"></i>
            <i class="bx bx-star"></i>
          </div>
          <h4 class="price">$50</h4>
        </div>
      </div>
    </div>
  </section>
  
	</div>

  
	<script type="text/javascript">
		let thumbnails = document.getElementsByClassName('thumbnail')

		let activeImages = document.getElementsByClassName('active')

		for (var i=0; i < thumbnails.length; i++){

			thumbnails[i].addEventListener('mouseover', function(){
				console.log(activeImages)
				
				if (activeImages.length > 0){
					activeImages[0].classList.remove('active')
				}
				

				this.classList.add('active')
				document.getElementById('featured').src = this.src
			})
		}


		let buttonRight = document.getElementById('slideRight');
		let buttonLeft = document.getElementById('slideLeft');

		buttonLeft.addEventListener('click', function(){
			document.getElementById('slider').scrollLeft -= 180
		})

		buttonRight.addEventListener('click', function(){
			document.getElementById('slider').scrollLeft += 180
		})


	</script>
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
  <script src="./js/index.js"></script>
</body>
</html>