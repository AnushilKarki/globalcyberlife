
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @foreach($posts as $post)
    <title>{{ $post->title }}</title>
@endforeach
    <!-- owl carousel css file cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/css/styleHome.css">

</head>
<body>

<!-- header section starts  -->


<header>

<div class="header-1">

    <a href="/" class="logo"> <i class="fas fa-shopping-bag"></i>  cyberlife </a>

    <div class="form-container">
    
        <form action="{{route('products.search')}}" method="GET">
                            <input name="query" placeholder="search products" type="search" id="search">
                          
                            <button type="submit" for="search" class="fas fa-search"> </button>
                        </form>
    </div>

</div>

<div class="header-2">

    <div id="menu" class="fas fa-bars"></div>

    <nav class="navbar">
        <ul>
            <li><a class="active" href="/">home</a></li>
            
        </ul>
    </nav>

    <div class="icons">
        <a href="#" class="fas fa-heart"></a>
        <a href="{{ route('cart.index') }}" class="fas fa-shopping-cart"></a>
        <a href="#" class="fas fa-user"></a>
    </div>

</div>

</header>

<section class="feature" id="featured">

<h1 class="heading"> <span> featured news </span> </h1>
@foreach ($posts as $product)
<div class="row">

    <div class="image-container">

        <div class="big-image">
        <img src="{{asset('storage/'.$product->image)}}" class="img-responsive">
        </div>

    </div>

    <div class="content">

      

       
    <h3>{{$product->title}}</h3>

    </div>

</div>
<div class="row">

    <div class="image-container">

       
    </div>

    <div class="content">

        
       
        <p>{{ $product->body }}</p>


    </div>

</div>
<!-- advertisement -->
@foreach($advertisements as $advertisement)
<div class="row">

    <div class="image-container">

    <div class="big-image">
        <img src="{{asset('storage/'.$advertisement->image)}}" class="img-responsive">
        </div>
    </div>

    <div class="content">

      

       

    </div>

</div>
@endforeach
<div class="row">

    <div class="image-container">

      
    </div>

    <div class="content">

      
    <a href="{{route('posts.index') }}"><button class="btn">go back</button></a>
       

    </div>

</div>
@endforeach
</section>


<section class="footer">

    <div class="box-container">

        <div class="box">
            <a href="#" class="logo"> <i class="fas fa-shopping-bag"></i> cyberlife </a>
            <p>welcome to global cyberlife where your shopping is made easier and more secure</p>
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
               kaushaltar,bahktapur
            </p>
            <p> <i class="fas fa-phone"></i>
                9849594857
            </p>
            <p> <i class="fas fa-globe"></i>
              www.globalcyberlife.com
            </p>
        </div>

    </div>



</section>

<!-- footer section ends -->






<!-- footer section ends -->

<!-- jquery cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- owl carousel js file cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<!-- custom js file link  -->
<script src="/js/home.js"></script>
    
</body>
</html>