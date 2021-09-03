@extends('shopadmin.layouts.home')
@section('content')
@foreach($complain as $comp)
<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Complain edit form</h4>
                                        <form method="POST" action="{{ route('complains.shop.update',$comp->id) }}">
                                        @csrf 
       @method('PUT') 
       <input type="hidden" value="{{$comp->id}}" name="complainid">
    
       <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Message</label>
                                            <input class="form-control" type="text" id="example-text-input" value="{{ $comp->message }}" name="msg">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">Status</label>
                                            <select class="form-control" name="status">
                                              
                                                <option value="REPORTED">Reported</option>
                                                <option value="SOLVED">Solved</option>
                                                <option value="PENDING">Pending</option>
                                            </select>
                                        </div>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            @endforeach
@endsection