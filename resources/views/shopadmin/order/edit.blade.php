@extends('shopadmin.layouts.home')
@section('content')


                                            <p>
                                               @foreach($suborders as $suborder)
                                             suborder id:   {{ $suborder->id }}
                                             grand total :   {{ $suborder->grand_total }}
                                               @endforeach
                                               <br><br>
                                               @foreach($products as $product)
product name :{{ $product->name }}
                                               @endforeach

                                               <br><br>
                                               @foreach($orders as $order)
                         phone no :   {{ $order->shipping_phone }}
                                               @endforeach<br><br>
                                               @foreach($items as $item)
 quantity :{{ $item->quantity }}
 color :{{ $item->color }}
 size :{{ $item->size }}
 <br><br>

                                               @endforeach
                                            
                                               </p>
                                           
                    
@endsection