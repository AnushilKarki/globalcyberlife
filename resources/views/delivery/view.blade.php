
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
<link rel="stylesheet" href="/css/stylesdelivery.css" />
<!-- custom css file link  -->
<link rel="stylesheet" href="/css/styleHome.css">

<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">

<!-- Box icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />

<!-- Custom StyleSheet -->
<link rel="stylesheet" href="/css/styles.css" />


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
.homebody{
  height:100%;
  width:100%;
}
</style>
    <title>Menu</title>
</head>
<body>

<!-- Navbar Section -->
<header>
    <div class="nav-container">

   <div class="menu">
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
         
        </li>
      
         
        <li>
            <a href="#" class="desktop-links">Gift</a>
            <input type="checkbox" id="show-features">
            <label for="show-features">Gift</label>
          
        </li>
           <li><a href="/delivery">Delivery</a></li>
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
<img src="../images/delivery.jpg" alt="" class="hero-img" />

<div class="hero-content">
  <h2><span class="discount">Fastest </span> Delivery</h2>
  <h1>
    <span>Service Starting @</span>
    <span>Rs 45 only</span>
  </h1>
  <a class="btn" href="#">Send Parcel now</a>
</div>
</header>


   <!-- End Navbar -->

 
   <!-- Start New Arrival -->



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

  <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/lightslider.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
    <script src="/js/indexdelivery.js"></script>

</body>
</html>