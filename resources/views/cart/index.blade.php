



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
           <a href="/">E-com</a>
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

   <div class="container">

        <h1>Shopping Cart</h1>
    
        <div class="cart">
    
            <div class="products">
    @foreach($cartitems as $item)
                <div class="product">
         <?php 

                   $itemid=$item->attributes['product_id'];
         ?>
				@php
                                        $photo = App\Models\Product::where('id', $itemid)->value('image');
                                        $colors= App\Models\Stock::where('product_id',$itemid)->get();
                                      
                                    @endphp
                  
					<img src="{{asset('storage/'.$photo)}}" >
    
                    <div class="product-info">
    
                        <h3>{{ $item->name }}</h3>
    
                        <h3>Rs {{ $item->price }}</h3>
                        <h3>Quantity: {{ $item->quantity }} </h3>

                        <h3> Color : {{ $item->attributes['color'] }}   &    Size : {{ $item->attributes['size'] }}</h3>
    

						<form action="{{route('cart.update',$item->id)}}" id="validate" class="validate">
							@csrf
             
<input name="quan" type="number" value="{{ $item->quantity }}" min="1" id="quans">
<input name="productid" type="hidden" value="{{$itemid}}">
<label for="cars">Choose a color:</label>

<select name="color" id="colors">
    @foreach($colors as $color)
  <option value="{{ $color->color }}">{{ $color->color }}</option>
  <?php  $weight=$color->weight;  ?>
@endforeach 
</select>
<input name="weight" type="hidden" value="{{ $weight }}">
weight: {{$weight }}

<select name="size" id="sizes">
    @foreach($colors as $color)
  <option value="{{ $color->size }}">{{ $color->size }}</option>
@endforeach 
</select>

<input type="submit" value="update">
</form>
    <br>
                        <p class="product-remove">
    
                        <a href="{{route('cart.destroy',$item->id)}}">remove<i class="fa fa-trash" aria-hidden="true"></i></a>
                          
						
    
                        </p>
    
                    </div>
    
                </div>
    @endforeach
                
    
            </div>
          

            <div class="cart-total">
            <form method="post" action="{{ route('cart.delivery') }}" id="validate" class="validate">
      @csrf
                <p>
    
                    <span>Price</span>
    
                    <span> Rs {{ \Cart::session(auth()->id())->getSubTotal()  }}</span>
    
                </p>
    
                <p>
    
                    <span>Item Count</span>
    
                    <span>{{ \Cart::session(auth()->id())->getContent()->count() }}</span>
    
                </p>
    
                <p>
          
                <span>DIstrict :</span>
    
                <input type="text" name="location" list="location" />
<datalist id="location">

  <option value="Bhojpur">Bhojpur</option>
  <option value="Dhankuta">Dhankuta</option>
  <option value="Ilam">Ilam</option>
  <option value="Jhapa">Jhapa</option>
  <option value="Khotang">Khotang</option>
  <option value="Morang">Morang</option>
  <option value="Okhaldhunga">Okhaldhunga</option>
  <option value="Panchthar">Panchthar</option>
  <option value="Sankhuwasabha">Sankhuwasabha</option>
  <option value="Solukhumbu">Solukhumbu</option>
  <option value="Sunsari">Sunsari</option>
  <option value="Taplejung">Taplejung</option>
  <option value="Tehrathum">Tehrathum</option>
  <option value=" Udayapur"> Udayapur</option>

  
<option value="Bara">Bara</option>
<option value="Parsa">Parsa</option>
<option value="Dhanusha">Dhanusha</option>
<option value="Mahottari">Mahottari</option>
<option value="Rautahat">Rautahat</option>
<option value="Saptari">Saptari</option>
<option value="Sarlahi">Sarlahi</option>
<option value="Siraha">Siraha</option>

	


<option value="Bhaktapur">Bhaktapur</option>
<option value="Chitwan">Chitwan</option>
<option value="Dhading">Dhading</option>
<option value="Dolakha">Dolakha</option>
<option value="Kathmandu">Kathmandu</option>
<option value="Kavrepalanchok">Kavrepalanchok</option>
<option value="Lalitpur">Lalitpur</option>
<option value="Makwanpur">Makwanpur</option>
<option value="Nuwakot">Nuwakot</option>
<option value="Ramechhap">Ramechhap</option>
<option value="Rasuwa">Rasuwa</option>
<option value="Sindhuli">Sindhuli</option>
<option value="Sindhupalchok">Sindhupalchok</option>


	


<option value="Baglung">Baglung</option>
<option value="Gorkha">Gorkha</option>
<option value="Kaski">Kaski</option>
<option value="Lamjung">Lamjung</option>
<option value="Manang">Manang</option>
<option value="Mustang">Mustang</option>
<option value="Myagdi">Myagdi</option>
<option value="Nawalpur">Nawalpur</option>
<option value="Parbat">Parbat</option>
<option value="Syangja">Syangja</option>
<option value="Tanahun">Tanahun</option>


<option value="Arghakhanchi">Arghakhanchi</option>
<option value="Banke">Banke</option>
<option value="Bardiya">Bardiya</option>
<option value="Dang">Dang</option>
<option value="Eastern_Rukum">Eastern Rukum</option>
<option value="Gulmi">Gulmi</option>
<option value="Kapilavastu">Kapilavastu</option>
<option value="Parasi">Parasi</option>
<option value="Palpa">Palpa</option>
<option value="Pyuthan">Pyuthan</option>
<option value="Rolpa">Rolpa</option>
<option value="Rupandehi">Rupandehi</option>


<option value="Dailekh">Dailekh</option>
<option value="Dolpa">Dolpa</option>
<option value="Humla">Humla</option>
<option value="Jajarkot">Jajarkot</option>
<option value="Jumla">Jumla</option>
<option value="Kalikot">Kalikot</option>
<option value="Mugu">Mugu</option>
<option value="Salyan">Salyan</option>
<option value="Surkhet">Surkhet</option>
<option value="Western_Rukum">Western Rukum</option>
	

<option value="Achham">Achham</option>
<option value="Baitadi">Baitadi</option>
<option value="Bajhang">Bajhang</option>
<option value="Bajura">Bajura</option>
<option value="Dadeldhura">Dadeldhura</option>
<option value="Darchula">Darchula</option>
<option value="Doti">Doti</option>
<option value="Kailali">Kailali</option>
<option value="Kanchanpur">Kanchanpur</option>
</datalist>
                   
                </p>
                
                <p>
             
 
    <input type="submit" value="Proceed">
                </p>
</form>
	
            </div>
    
        </div>
    
    </div>



    <div class="container">

<h1>Coupon/Discount</h1>

<div class="cart">

    <div class="products">

        <div class="product">
 <?php 
       
 ?>
@php

                          
                                $packages= App\Models\Delivery_package::where('status','active')->get();
                            @endphp
          


            <div class="product-info">

            <form method="post" action="{{ route('cart.coupon') }}" id="validate" class="validate">
      @csrf
             <h3> <label for="deliverytype">Discount type</label></h3>
                <select name="type" id="sizes">

<option value="coupon">Coupon</option>
<option value="express">buy more,pay less</option>
<option value="product">Product Discount</option>
<option value="customer">Regular Customer</option>
</select>
<span>
 <h3> <label for="district">Code</label></h3>
  <input type="text" name="code" />

</span>
  
                <h4 class="product-price"> note : select discount type you want and enter the code </h4>
               


   

<input type="submit" value="Apply">
</form>

               

            </div>

        </div>


    </div>
  


</div>

</div>




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

   <script>
	$('#validate').validate({
    roles: {
        quan: {
            required: true,
        },
        color: {
            required: true,
        },
        size: {
            required: true,
        },
       
      
       
    },
    messages: {
        quan:"Please input quantity*",
        color:"Please input color*",
        size:"Please input size*"
       
    },
});
const form  = document.getElementsByTagName('form')[0];

const quantity = document.getElementById('quans');

const color = document.getElementById('colors');

const size = document.getElementById('sizes');

const quantityError = document.querySelector('#mail + span.error');
const colorError = document.querySelector('#color + span.error');
const sizeError = document.querySelector('#size + span.error');
quantity.addEventListener('input', function (event) {
  // Each time the user types something, we check if the
  // form fields are valid.

  if (quantity.validity.valid) {
    // In case there is an error message visible, if the field
    // is valid, we remove the error message.
    quantityError.textContent = ''; // Reset the content of the message
    quantityError.className = 'error'; // Reset the visual state of the message
  } else {
    // If there is still an error, show the correct error
    showError();
  }
});
color.addEventListener('select', function (event) {
  // Each time the user types something, we check if the
  // form fields are valid.

  if (color.validity.valid) {
    // In case there is an error message visible, if the field
    // is valid, we remove the error message.
    colorError.textContent = ''; // Reset the content of the message
    colorError.className = 'error'; // Reset the visual state of the message
  } else {
    // If there is still an error, show the correct error
    showError();
  }
});
size.addEventListener('select', function (event) {
  // Each time the user types something, we check if the
  // form fields are valid.

  if (size.validity.valid) {
    // In case there is an error message visible, if the field
    // is valid, we remove the error message.
    sizeError.textContent = ''; // Reset the content of the message
    sizeError.className = 'error'; // Reset the visual state of the message
  } else {
    // If there is still an error, show the correct error
    showError();
  }
});

form.addEventListener('submit', function (event) {
  // if the email field is valid, we let the form submit

  if(!quantity.validity.valid) {
    // If it isn't, we display an appropriate error message
    showError();
    // Then we prevent the form from being sent by canceling the event
    event.preventDefault();
  }
  if(!size.validity.valid) {
    // If it isn't, we display an appropriate error message
    showError();
    // Then we prevent the form from being sent by canceling the event
    event.preventDefault();
  }
  if(!color.validity.valid) {
    // If it isn't, we display an appropriate error message
    showError();
    // Then we prevent the form from being sent by canceling the event
    event.preventDefault();
  }
});

function showError() {
  if(quantity.validity.valueMissing) {
    // If the field is empty,
    // display the following error message.
    quantityError.textContent = 'You need to enter an value for quantity.';
  } else if(quantity.validity.typeMismatch) {
    // If the field doesn't contain an email address,
    // display the following error message.
    quantityError.textContent = 'Entered value needs to be an color.';
  } 
  if(color.validity.valueMissing) {
    // If the field is empty,
    // display the following error message.
    colorError.textContent = 'You need to enter an value for color.';
  } else if(color.validity.typeMismatch) {
    // If the field doesn't contain an email address,
    // display the following error message.
    colorError.textContent = 'Entered value needs to be an color.';
  } 
  if(size.validity.valueMissing) {
    // If the field is empty,
    // display the following error message.
    sizeError.textContent = 'You need to enter an value for size.';
  } else if(size.validity.typeMismatch) {
    // If the field doesn't contain an email address,
    // display the following error message.
    sizeError.textContent = 'Entered value needs to be an size.';
  } 
  // Set the styling appropriately
  quantityError.className = 'error active';
  colorError.className = 'error active';
  sizeError.className = 'error active';
}
</script>
    <!-- jquery cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- owl carousel js file cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<!-- custom js file link  -->
<script src="/js/home.js"></script>

</body>
</html>