@extends('shopadmin.layouts.home')
@section('content')
@foreach($return as $purc)
<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Return/Exchange form</h4>
                                        <form method="POST" action="{{ route('shoporderreturns.update',$purc->id) }}">
                                        @csrf 
       @method('PUT') 
       <input type="hidden" value="{{$purc->sub_order_id}}" name="orderid">
       
       <input type="hidden" value="{{$purc->type}}" name="type">
                                       
                                            <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Reason</label>
                                            <input class="form-control" value="{{$purc->reason}}" name="reason" type="text" id="example-text-input">
                                        </div>
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">charge</label>
                                            <input class="form-control" name="charge" type="integer" id="example-text-input">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">Status</label>
                                            <select class="form-control" name="status">
                                            <option value="PENDING">Pending</option>
                                                <option value="COMPLETED">Completed</option>
                                                <option value="DECLINED">Declined</option>
                                            </select>
                                        </div>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            @endforeach
@endsection