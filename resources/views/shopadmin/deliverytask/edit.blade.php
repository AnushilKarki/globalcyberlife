@extends('shopadmin.layouts.home')
@section('content')


<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Delivery Task Action form</h4>
                                        <form method="POST" action="{{ route('deliverytasks.update',$id) }}">
                                        @csrf 
       @method('PUT') 
       <input type="hidden" value="{{ $id }}" name="taskid">
    
       <div class="form-group">
           
<label>choose status:</label>

<select name="stat">
 
  <option value="completed">Completed</option>
  <option value="failed">Failed</option>
  <option value="verified">Verify</option>
  <option value="pending">Pending</option>
</select>
                                   
                                        </div>
                                        <div class="form-group">
                                            <label>note</label>
                                            <input type="text" value="" name="reason">
                                        </div>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
              
@endsection