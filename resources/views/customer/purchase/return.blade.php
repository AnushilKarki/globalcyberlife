@extends('customer.layouts.home')
@section('content')
@foreach($purchase as $purc)
<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Return/Exchange form</h4>
                                        <form method="POST" action="{{ route('customerpurchasereturns.store') }}">
                                        @csrf 
       <input type="hidden" value="{{$purc->id}}" name="orderid">
       <input type="hidden" value="{{$purc->grand_total}}" name="amount">
                                        <div class="form-group">
                                            <label class="col-form-label">type</label>
                                            <select class="form-control" name="type">
                                              
                                                <option value="REFUND">Return</option>
                                                <option value="EXCHANGE">Exchange</option>
                                            </select>
                                        </div>
                                            <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Reason</label>
                                            <input class="form-control" name="reason" type="text" id="example-text-input">
                                        </div>
                                       
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            @endforeach
@endsection