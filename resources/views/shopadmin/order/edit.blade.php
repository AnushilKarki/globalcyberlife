@extends('customer.layouts.home')
@section('content')


                                            <p>
                                               @foreach($suborders as $suborder)
                                             suborder id:   {{ $suborder->id }}
                                             grand total :   {{ $suborder->grand_total }}
                                               @endforeach
                                               @foreach($orders as $order)
                         phone no :   {{ $order->shipping_phone }}
                                               @endforeach
                                               @foreach($items as $item)
 quantity :{{ $item->quantity }}
                                               @endforeach
                                               @foreach($products as $product)
product name :{{ $product->name }}
                                               @endforeach
                                               </p>
                                           
                    
@endsection