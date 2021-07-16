@extends('customer.layouts.home')
@section('content')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Orders Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Order no</th>
                                                    <th scope="col">Total amount</th>
                                              
                                                    <th scope="col">status</th>
                                                    <th scope="col">action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($orders as $order)
                                                <tr>
                                                    <th scope="row">{{ $order->id }}</th>
                                                    <td>{{ $order->order_id }}</td>
                                                    <td>{{ $order->grand_total }}</td>
                                                 
                                                    <td><span class="status-p bg-primary">{{ $order->status }}</span></td>
                                                    <td>
                                                    <ul class="d-flex justify-content-center">
                                                        
                                                        
                                                        <form method="POST" action="{{ route('customerorders.update',$order->id) }}">
       @csrf 
       @method('PUT')
      
       
      
       <button type="submit">cancel order</button>
    </form>
                                                    </ul>
                                                    </td>
                                                </tr>
                                              @endforeach
                                             
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
@endsection