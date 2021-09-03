@extends('customer.layouts.home')
@section('content')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Purchases </h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                              
                                                    <th scope="col">Order id</th>
                                                    <th scope="col">Total amount</th>
                                                    <th scope="col">Review</th>
                                                
                                                    <th scope="col">action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($purchases as $purchase)
                                                <tr>
                                                   
                                                    <td>{{ $purchase->id }}</td>
                                                    <td>{{ $purchase->grand_total }}</td>
                                                 
                                                  
                                                    <td>{{ $purchase->review }}</td>
                                                    <td>
                                                 <a href="{{ route('customerpurchasereturns.edit',$purchase->id) }}">return/exchange</a>  
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
                    <div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Returns/Exchange </h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">order id</th>
                                                    <th scope="col">Type</th>
                                                    <th scope="col">Reason</th>
                                                    <th scope="col">status</th>
                                                  
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($returns as $return)
                                                <tr>
                                                    <th scope="row">{{ $return->id }}</th>
                                                    <td>{{ $return->orderid }}</td>
                                                    <td>{{ $return->type }}</td>
                                                 
                                                  
                                                    <td>{{ $return->reason }}</td>
                                                    <td>
                                               {{ $return->status }}
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