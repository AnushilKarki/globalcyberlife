

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- Favicon -->
  <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
  <!-- Box icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />

  <!-- Custom StyleSheet -->
  <link rel="stylesheet" href="/css/stylesdelivery.css" />
  <title>Codevo - Ecommerce Website</title>
</head>

<body>
  <!-- Header -->
  <header id="home" class="header">
    <!-- Navigation -->
    <nav class="nav">
      <div class="navigation container">
        <div class="logo">
          <h1>Cyberlife</h1>
        </div>

        <div class="menu">
          <div class="top-nav">
            <div class="logo">
              <h1>cyberlife</h1>
            </div>
            <div class="close">
              <i class="bx bx-x"></i>
            </div>
          </div>

          <ul class="nav-list">
            <li class="nav-item">
              <a href="/" class="nav-link">Shopping</a>
            </li>
            <li class="nav-item">
              <a href="product.html" class="nav-link">Send Parcel</a>
            </li>
            <li class="nav-item">
              <a href="#about" class="nav-link scroll-link">Track Parcel</a>
            </li>
            <li class="nav-item">
              <a href="{{ route('riders.index') }}" class="nav-link">Earn with cyberlife</a>
            </li>
           
            <li class="nav-item">
              <a href="/home" class="nav-link">staff login</a>
            </li>
           
          </ul>
        </div>

        <a href="cart.html" class="cart-icon">
          <i class="bx bx-shopping-bag"></i>
        </a>

        <div class="hamburger">
          <i class="bx bx-menu"></i>
        </div>
      </div>
    </nav>

    <!-- Hero -->

    <!-- Hero -->
    <img src="../images/de.jpg" alt="" class="hero-img" />


    
    

   
  </header>

  <!-- Main -->
  <main>
   
    <!-- Testimonials -->
    <section class="section">
      <div class="testimonial-center container">
        <div class="testimonial">
            <h2>Bike Registration</h2><br>
        <form method="post" action="{{ route('riders.store') }}">
@csrf
  <label for="lname">Name:</label>
  <input type="text" id="name" name="name"><br><br>
  <label for="phone">phone:</label>
  <input type="text" id="phone" name="phone">
  
  <label for="address">Choose your city:</label>
<select id="address" name="address">
  <option value="kathmandu">Kathmadnu</option>
  <option value="lalitpur">Lalitpur</option>
  <option value="bhaktapur">Bhaktapur</option>

</select> <br><br>
<input type="hidden" value="bike" id="name" name="vehicletype">
<label for="jobtype">Choose your job type:</label>
<select id="jobtype" name="jobtype">
  <option value="part_time">Part Time</option>
  <option value="full_time">Full Time</option>


</select> <br><br>
<label for="phone">vehicle name:</label>
  <input type="text" id="phone" name="vehiclename"><br><br>
  <input type="submit" value="submit">
</form> 
        </div>
        <div class="testimonial">
            <h2>Car/van Registration</h2><br>
            <form>

<label for="lname">Name:</label>
<input type="text" id="name" name="name"><br><br>
<label for="phone">phone:</label>
<input type="text" id="phone" name="phone">

<label for="address">Choose your city:</label>
<select id="address" name="address">
<option value="kathmandu">Kathmadnu</option>
<option value="lalitpur">Lalitpur</option>
<option value="bhaktapur">Bhaktapur</option>

</select> <br><br>
<input type="hidden" value="car" id="name" name="vehicletype">
<label for="jobtype">Choose your job type:</label>
<select id="jobtype" name="jobtype">
<option value="part_time">Part Time</option>
<option value="full_time">Full Time</option>


</select> <br><br>
<label for="phone">vehicle name:</label>
  <input type="text" id="phone" name="vehiclename"><br><br>
  <input type="submit" value="submit">
</form> 
        </div>
      </div>
    </section>
    <!-- Product Banner -->
    <section class="section">
      <div class="product-banner">
        <div class="left">
          <img src="./images/test.jpg" alt="" />
        </div>
        <div class="right">
          <div class="content">
            <h2><span class="discount">Fastest </span> Delivery</h2>
            <h1>
              <span>Collect Your</span>
              <span>Kids Collection</span>
            </h1>
            <a class="btn" href="#">shop now</a>
          </div>
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
  </main>

  <!-- Footer -->
  <footer id="footer" class="section footer">
    <div class="container">
      <div class="footer-container">
        <div class="footer-center">
          <h3>EXTRAS</h3>
          <a href="#">Brands</a>
          <a href="#">Gift Certificates</a>
          <a href="#">Affiliate</a>
          <a href="#">Specials</a>
          <a href="#">Site Map</a>
        </div>
        <div class="footer-center">
          <h3>INFORMATION</h3>
          <a href="#">About Us</a>
          <a href="#">Privacy Policy</a>
          <a href="#">Terms & Conditions</a>
          <a href="#">Contact Us</a>
          <a href="#">Site Map</a>
        </div>
        <div class="footer-center">
          <h3>MY ACCOUNT</h3>
          <a href="#">My Account</a>
          <a href="#">Order History</a>
          <a href="#">Wish List</a>
          <a href="#">Newsletter</a>
          <a href="#">Returns</a>
        </div>
        <div class="footer-center">
          <h3>CONTACT US</h3>
          <div>
            <span>
              <i class="fas fa-map-marker-alt"></i>
            </span>
            42 Dream House, Dreammy street, 7131 Dreamville, USA
          </div>
          <div>
            <span>
              <i class="far fa-envelope"></i>
            </span>
            company@gmail.com
          </div>
          <div>
            <span>
              <i class="fas fa-phone"></i>
            </span>
            456-456-4512
          </div>
          <div>
            <span>
              <i class="far fa-paper-plane"></i>
            </span>
            Dream City, USA
          </div>
        </div>
      </div>
    </div>
    </div>
  </footer>
  <!-- End Footer -->

  <!-- GSAP -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
  <!-- Custom Script -->
  <script src="/js/indexdelivery.js"></script>
</body>

</html>