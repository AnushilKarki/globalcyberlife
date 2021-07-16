@extends('shopadmin.layouts.home')
@section('content')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">User Discounts Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">particular</th>
                                                    <th scope="col">Discount amount</th>
                                                   
                                                    <th scope="col">status</th>
                                                   
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($discounts as $discount)
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>{{ $discount->particular }}</td>
                                                    <td>{{ $discount->discount_amount }}</td>
                                                  
                                                    <td><span class="status-p bg-primary">{{ $discount->status }}</span></td>
                                                  
                                                    
                                                </tr>
                                              @endforeach
                                             
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Product Discounts Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">product</th>
                                                    <th scope="col">Discount amount</th>
                                                   
                                                    <th scope="col">status</th>
                                                   
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($products as $product)
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>{{ $product->product_id }}</td>
                                                    <td> {{ $product->discount_amount }}</td>
                                                  
                                                    <td><span class="status-p bg-primary">{{ $product->status  }}</span></td>
                                                  
                                                    
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