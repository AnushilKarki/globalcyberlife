@extends('shopadmin.layouts.home')
@section('content')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Order Payment Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Particular</th>
                                                    <th scope="col">Order id</th>
                                                    <th scope="col">Total amount</th>
                                                    <th scope="col">Paid</th>
                                                    <th scope="col">Remaining</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">Pay</th>
                                                    <th scope="col">view pdf</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($payments as $payment)
                                                <tr>
                                                    <th scope="row">{{ $payment->id }}</th>
                                                    <td>{{ $payment->order_id }}</td>
                                                    <td>{{ $payment->total }}</td>
                                                    <td>{{ $payment->paid }}</td>
                                                    <td>{{ $payment->remaining }}</td>
                                                    <td><span class="status-p bg-primary">{{ $payment->status }}</span></td>
                                                    <td>  <a href="{{ route('shoporders.edit',$order->id) }}">Pay</a>
                                                   
                        
                                                    <td>  <a href="{{ route('shoporders.edit',$order->id) }}">View PDF</a>
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