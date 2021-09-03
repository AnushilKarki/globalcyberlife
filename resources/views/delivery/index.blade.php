




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

<link rel="stylesheet" href="/css/footer.css">
<!-- custom css file link  -->


<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">

<!-- Box icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />

<!-- Custom StyleSheet -->
<link rel="stylesheet" href="/css/styles.css" />

<link rel="stylesheet" href="/css/stylesdelivery.css" />
<link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/lightslider.css">
 

    <style>
.cont {
  height: 40px;
  position: relative;
  border: 3px solid green;
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

/*modlas for send parsal*/

.sendparcel {
  width: 50%;
  height: 70%;
  margin-left: auto;
  margin-right: auto;
  margin-top: 90px;
  display: none;
}
.sendparcel form {
  background-color: rgba(98, 171, 226, 0.9);
  height: 100%;
}

.sendparcel .row {
  display: flex;
}
.sendparcel .col1 {
  flex-basis: 50%;
  margin-left: 20px;
}
.sendparcel .col1 input {
  width: 80%;
}
.sendparcel .col1 select {
  width: 80%;
}
.sendparcel #cross {
  float: right;
}
textarea {
  height: 50px;
  width: 80%;
  margin-top: 10px;
}
.sendparcel .something {
  margin-left: 20px;
}
.sendparcel .something .hero {
  margin-left: 40%;
  margin-right: auto;
  margin-top: 10px;

  padding: 10px 24px;
}
.sendparcel .something textarea {
  margin-left: 20px;
  margin-right: 20px;
}
.sendparcel .something #email {
  width: 80%;
  margin-left: 20px;
}
/*css for track parsel model*/
.trackParcel {
  height: 200px;
  margin-top: 60px;
  width: 400px;
  text-align: center;
  float: right;
  display: none;
}
.trackParcel h2 {
  font-size: 20px;
  text-align: center;
  padding-top: 20px;
  margin-top: 10px;
}
.trackParcel a {
  font-size: 40px;
  margin-top: 20px;
}

.trackparcel .field {
  padding-top: 20px;
}
.trackParcel .cross {
  float: right;
}

.trackParcel form {
  background-color: rgba(98, 171, 226, 0.9);
  height: 200px;
  width: 400px;
  margin-top: 50px;
}

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
 .full{
  height:80%;
  width:100%;
  margin-left : 40px;
  margin-right:20px;
  margin-top : 10px;
  
}

/*  rider register */

.registerrider {
  width: 50%;
  height: 70%;
  margin-left: auto;
  margin-right: auto;
  margin-top: 90px;
  display: none;
}
.registerrider form {
  background-color: rgba(98, 171, 226, 0.9);
  height: 100%;
}

.registerrider .row {
  display: flex;
}
.registerrider .col1 {
  flex-basis: 50%;
  margin-left: 20px;
}
.registerrider .col1 input {
  width: 80%;
}
.registerrider .col1 select {
  width: 80%;
}
.registerrider #cross2 {
  float: right;
}
textarea {
  height: 50px;
  width: 80%;
  margin-top: 10px;
}
.registerrider .something {
  margin-left: 20px;
}
.registerrider .something .hero {
  margin-left: 40%;
  margin-right: auto;
  margin-top: 10px;

  padding: 10px 24px;
}
.registerrider .something textarea {
  margin-left: 20px;
  margin-right: 20px;
}
.registerrider .something #email {
  width: 80%;
  margin-left: 20px;
}

/*  franchise register */

.franchise {
  width: 50%;
  height: 70%;
  margin-left: auto;
  margin-right: auto;
  margin-top: 90px;
  display: none;
}
.franchise form {
  background-color: rgba(98, 171, 226, 0.9);
  height: 100%;
}

.franchise .row {
  display: flex;
}
.franchise .col1 {
  flex-basis: 50%;
  margin-left: 20px;
}
.franchise .col1 input {
  width: 80%;
}
.franchise .col1 select {
  width: 80%;
}
.franchise #cross3 {
  float: right;
}
textarea {
  height: 50px;
  width: 80%;
  margin-top: 10px;
}
.franchise .something {
  margin-left: 20px;
}
.franchise .something .hero {
  margin-left: 40%;
  margin-right: auto;
  margin-top: 10px;

  padding: 10px 24px;
}
.franchise .something textarea {
  margin-left: 20px;
  margin-right: 20px;
}
.franchise .something #email {
  width: 80%;
  margin-left: 20px;
}
</style>
    <title>Menu</title>
</head>
<body>

    <!-- Here starts the Html form for ModaL for send prsel -->
  
    @php
                                     
                                     $areas= App\Models\Shop::where('is_active',true)->get();
                                   
                                 @endphp
  <!-- Header -->
  <header id="home" class="header">
    <!-- Navigation -->

    
    <div class="trackParcel" id="trackParcel1">
      <form>
        <div class="cross"><i class="fa fa-times" aria-hidden="true" id="cross1"></i></div>
        <h2>Shipment Summary</h2><br>
    
        <a href="#"><i class="fa fa-globe"></i></a>
        <br>
        <div class="field"><br>
          <label>Shipment ID:</label>
          <input type="text " id="shipmentID">
          <button type="submit">Track</button>
        </div>
  
      </form>
    </div>

<div class="nav-container">

<div class="menu">
<div class="topofnav">

<ul id="menu1">
  <li><h3>Franchise a friend oppertunity only on global cyberlife</h3></li>


</ul>  

</div>
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
       <li><a href="/">GoTo Shopping</a></li>
     

    <li>  <a href="#" id="trackParcel">Track parcel</a></li>

      
       <li><a href="#" id="registerRider">Register rider</a></li>
       <li><a href="#" id="registerFranchise">Franchise Registration</a></li>
       <li><a href="/riderhome">Staff Login</a></li>
   </ul>
</div>
<label for="show-search" class="menu-search"><i class="fas fa-search    "></i></label>
<form action="{{route('products.search')}}" class="search-box">
    <input type="text" placeholder="Type Something to Search" required>
    <button type="submit" class="go-icon"><i class="fas fa-long-arrow-alt-right    "></i></button>
</form>

</nav>
</div>

</div>
  <!-- franchise registration -->
  <div class="franchise" id="franchise">
      <form>
        <!-- Cross icon for cancelling the model-->
        <i class="fa fa-times" aria-hidden="true" id="cross3"></i><br>
        <div class="row">
          <div class="col1">
    
            Name:<br />
            <input type="text" placeholder="ram shah" required><br><br>
    
            Address:<br />
            <input type="text" placeholder="100" required><br><br>
    
    
            franchise location:<br />
            <input type="text" placeholder="dhangadi" required><br><br>
            Contact no:<br />
            <input type="text" placeholder="9845******" required><br><br>
    
    
          </div>
    
          <div class="col1">
    
          Education <br />
            <select name="cars" id="cars" required>
           
             
              <option value="slc">SLC</option>
              <option value="plus2">+2</option>
              <option value="bachelor">Bachelor Degree</option>
              <option value="master">Master Degree</option>
              <option value="none">NOne</option>
            </select><br><br>
    
             Working experience<br />
            <select name="cars" id="cars" required>
           
             
              <option value="yes">YES</option>
              <option value="no">NO</option>
     
            </select><br><br>
    
    
            Investment :<br />
            <select name="cars" id="cars" required>
           
             
              <option value="small">Small</option>
              <option value="medium">Medium</option>
              <option value="large">Large</option>
              <option value="verylarge">Very Large</option>
            </select><br><br>
            Are you excited to join us ? <br />
            <select name="cars" id="cars" required>
           
             
              <option value="small">Excited</option>
              <option value="medium">Very Excited</option>
              <option value="large">Not Excited</option>
              <option value="verylarge">None</option>
            </select><br><br>
    
          </div>
        </div>
        <div class="something">
    
          Your Email:<br>
          <input type="email" placeholder="abc123@gmail.com" id="email"><br><br><br>
    
          Write your Queries:<br>
          <textarea placeholder="write about your quires/review"></textarea><br>
          <input type="submit"class="hero" id="summit">
        </div>
      
      </form>
    
    </div>
    <!-- close franchise registration -->
  <!-- rider registration -->
  <div class="registerrider" id="registerrider">
      <form method="post" action="{{ route('riders.store') }}">
        @csrf
        <!-- Cross icon for cancelling the model-->
        <i class="fa fa-times" aria-hidden="true" id="cross2"></i><br>
        <div class="row">
          <div class="col1">
    
          Name:<br />
            <input type="text" placeholder="ram shah" name="name" required><br><br>
    
            Address:<br />
            <input type="text" placeholder="100" name="address" required><br><br>
    
    
           
            Contact no:<br />
            <input type="text" placeholder="9845******" name="contact" required><br><br>
            Working Location:<br />
            <select name="area" id="cars" required>
              @foreach($areas as $area)
             
              <option value="{{ $area->name }}">{{ $area->name }}</option>
              @endforeach
            </select><br><br>
          </div>
    
          <div class="col1">
    
            Vehicle model:<br />
            <input type="text" name="model" placeholder="eg : pulsar 220" required><br><br>
    
            Vehicle type <br />
            <select name="type" id="cars" required>
           
         
              <option value="motorbike">MotorBike</option>
              <option value="car">car</option>
              <option value="van">Van</option>
              <option value="cycle">Cycle</option>
              <option value="electric">electric vehicle</option>
            </select><br><br>
    
             Working experience<br />
            <select name="experience" id="cars" required>
           
             
              <option value="yes">YES</option>
              <option value="no">NO</option>
     
            </select><br><br>
    
    
            Job type :<br />
            <select name="jobtype" id="cars" required>
           
             
              <option value="part_time">Part Time</option>
              <option value="full_time">Full Time</option>
            
            </select><br><br>
            Are you excited to join us ? <br />
            <select name="excitement" id="cars" required>
           
             
              <option value="small">Excited</option>
              <option value="medium">Very Excited</option>
              <option value="large">Super Excited</option>
              <option value="verylarge">None</option>
            </select><br><br>
          </div>
        </div>
        <div class="something">
    
          Your Email:<br>
          <input type="email" name="email" placeholder="abc123@gmail.com" id="email"><br><br><br>
    
          Write your Queries:<br>
          <textarea placeholder="write about your quires/review" name="querry"></textarea><br>
          <input type="submit"class="hero" id="summit"></button>
        </div>
      </form>
    
    </div>
    <!-- close rider registration -->
<div class="sendparcel" id="sendparcel">
      <form>
        <!-- Cross icon for cancelling the model-->
        <i class="fa fa-times" aria-hidden="true" id="cross"></i><br>
        <div class="row">
          <div class="col1">
    
            From:<br />
            <input type="text" placeholder="eg : Kathmandu" required><br><br>
    
            Weight:<br />
            <input type="text" placeholder="100" required><br><br>
    
    
            Sender:<br />
            <input type="text" placeholder="Sender's Full Name" required><br><br>
            Receiver:<br />
            <input type="text" placeholder="Receiver Full Name" required><br><br>
    
    
          </div>
    
          <div class="col1">
    
            To:<br />
            <input type="text" placeholder="eg : Simara" required><br><br>
    
            Receiver District:<br />
            <select name="cars" id="cars" required>
              @foreach($areas as $area)
             
              <option value="{{ $area->name }}">{{ $area->name }}</option>
              @endforeach
            </select><br><br>
    
    
            Sender Mobile Number:<br />
            <input type="text" placeholder="98********" required><br><br>
            Receiver Mobile Number:<br />
            <input type="text" placeholder="98********" required><br><br>
    
    
          </div>
        </div>
        <div class="something">
    
          Your Email:<br>
          <input type="email" placeholder="abc123@gmail.com" id="email"><br><br><br>
    
          Write your Queries:<br>
          <textarea placeholder="write about your quires/review"></textarea><br>
          <input type="submit"class="hero" id="summit"></button>
        </div>
      </form>
    
    </div>
   
    <!-- Hero -->

    <!-- Hero -->
    <img src="../images/deliver.jpg" alt="" class="hero-img" />


    <div class="hero-content">
      <h2><span class="discount">Fastest </span> Delivery</h2>
      <h1>
        <span>Service Starting @</span>
        <span>Rs 45 only</span>
      </h1>
      <a class="btn" id="SendParsal" href="#">Send Parcel now</a>
    </div>
    

   
  </header>
  <!-- Main -->
  <main>
   
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

const crosses=document.getElementById("cross")

const summits=document.getElementById("summit")

crosses.addEventListener("click",function(){
   document.getElementById("sendparcel").style.display="none"
})

const SendP =document.getElementById("SendParsal")
SendP.addEventListener("click",function(){
  document.getElementById("sendparcel").style.display="block"
})

/*modal JavaScript For track Parsal*/

const trackP=document.getElementById("trackParcel")

trackP.addEventListener("click",function(){
  document.getElementById("trackParcel1").style.display="block"
})

const cross1=document.getElementById("cross1")

cross1.addEventListener("click",function(){
  document.getElementById("trackParcel1").style.display="none"
})
/* register rider */
const crosse=document.getElementById("cross2")

crosse.addEventListener("click",function(){
   document.getElementById("registerrider").style.display="none"
})

const Register =document.getElementById("registerRider")
Register.addEventListener("click",function(){
  document.getElementById("registerrider").style.display="block"
})

/* register franchise */
const cross=document.getElementById("cross3")

cross.addEventListener("click",function(){
   document.getElementById("franchise").style.display="none"
})

const register =document.getElementById("registerFranchise")
register.addEventListener("click",function(){
  document.getElementById("franchise").style.display="block"
})
   </script>
 
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
  
</body>
</html>