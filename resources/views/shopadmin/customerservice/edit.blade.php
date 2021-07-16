@extends('shopadmin.layouts.home')
@section('content')
@foreach($services as $service)
<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Complain edit form</h4>
                                        <form method="POST" action="{{ route('customerservices.shop.update',$service->id) }}">
                                        @csrf 
       @method('PUT') 
       <input type="hidden" value="{{$service->id}}" name="serviceid">
    
       <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Answer</label>
                                            <input class="form-control" type="text" id="example-text-input" value="{{ $service->answer }}" name="answer">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">Status</label>
                                            <select class="form-control" name="status">
                                              
                                                <option value="processing">processing</option>
                                                <option value="completed">completed</option>
                                                <option value="declined">declined</option>
                                            </select>
                                        </div>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            @endforeach
@endsection