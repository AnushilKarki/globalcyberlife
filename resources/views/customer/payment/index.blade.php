
@extends('customer.layouts.home')
@section('content')
@include('customer.payment.accountdetail')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Payments Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Order</th>
                                                    <th scope="col">Type</th>
                                                    <th scope="col">particular</th>
                                                    <th scope="col">Grand TOtal</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">action</th>
                                                    <th scope="col">view pdf</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($payments as $payment)
                                                <tr>
                                                    <th scope="row">{{ $payment->id }}</th>
                                                    <td>{{ $payment->order_id }}</td>
                                                    <td>{{ $payment->payment_type }}</td>
                                                    <td>{{ $payment->particular }}</td>
                                                    <td>{{ $payment->total }}</td>
                                                    <td>{{ $payment->status }}</td>
                                                    <td>  <a href="{{ route('customerpayments.edit',$payment->id) }}">pay</a>  </td>
                                                    <td>
                                                       <a href="{{ route('customerpayments.pdf') }}"></a>
                  
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
