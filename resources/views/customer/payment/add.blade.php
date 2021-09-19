@extends('customer.layouts.home')
@section('content')
@foreach($payments as $payment)
<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">payment form</h4>
                                        <form method="POST" action="{{ route('customerpayments.update',$payment->id) }}">
                                        @csrf 
       @method('PUT') 
       <input type="hidden" value="{{$payment->id}}" name="paymentid">
    
       <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Total : {{ $payment->total }}</label>

                                        </div>
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Remaining : {{ $payment->remaining }}</label>

                                        </div>
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">payment method</label>
                                            <h2><select name="type" id="colors">
   
   <option value="cash_on_delivery">cash on delivery</option>
   <option value="card">card</option>
   <option value="mobile_banking">mobile banking</option>
   <option value="mobile_wallet">Mobile wallet</option>
 </select>                         
 </h2>
                                        </div>
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Amount paid</label>
                                            <input class="form-control" type="number" id="example-text-input"  name="paid">
                                        </div>
                                        <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            @endforeach
@endsection