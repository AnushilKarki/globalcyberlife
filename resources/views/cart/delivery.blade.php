



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
@php 

@endphp
   <div class="container">

        <h1>Shipping Form</h1>
    
        <div class="cart">
    
            <div class="products">
 
                <div class="product">
        
				@php
                                       
                                    @endphp
                  
	
    
                    <div class="product-info">
                    <form method="post" action="{{ route('cart.shipping') }}" id="validate" class="validate">
							@csrf
             
                      
              <label for="deliverytype">Choose delivery type</label>
                <select name="type" id="sizes">
                @foreach($packages as $package)
  <option value="{{ $package->delivery_type }}">{{ $package->delivery_type }}</option>

@endforeach
</select>

  <input type="hidden" name="state" value="{{ $state }}"/>

<span>
  <label for="district">Your address</label>

<select name="address" id="sizes">
                @foreach($addre as $package)
  <option value="{{ $package->address }}">Near {{ $package->address }}</option>

@endforeach
</select>
            <br>   
                <label for="district">Delivery Time</label>
  <input type="text" name="time"list="time" />
<datalist id="time">

 <option value="morning">Morning</option>
 <option value="day">Day</option>
 <option value="evening">Evening</option>
</datalist>

                <h4 class="product-price"> Delivery weight :{{ $totalweight }} kg</h4>
                <input type="hidden" name="weight" value="{{ $totalweight }}">

                <input type="hidden" name="location" value="{{ $location }}">


<input type="submit" value="submit">
</form>
    <br>
                      
                          
						
    
                        </p>
    
                    </div>
    
                </div>

                
    
            </div>
          

            <div class="cart-total">
    
              
    
                <p>
    
                    <span>Note :</span>
    
                    <span> </span>
    
                </p>
                <p>
    
    <span>Details :</span>
   
    <span> </span>

</p>
                <p>
                

                   
                </p>
                
                <p>
                
  
                 
                </p>

	
            </div>
    
        </div>
    
    </div>



    <div class="container">



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