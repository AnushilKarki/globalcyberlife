@extends('shopadmin.layouts.home')
@section('content')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Parcels </h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">track id</th>
                                                    <th scope="col">Pickup Address</th>
                                                    <th scope="col">Delivery Address</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">show</th>
                                                    <th scope="col">action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($parcels as $parcel)
                                                <tr>
                                                    <th scope="row">{{ $parcel->id }}</th>
                                                    <td>{{ $parcel->track }}</td>
                                                    <td>{{ $parcel->pickup_address }}</td>
                                                    <td>{{ $parcel->delivery_address }}</td>
                            
                                                 
                                                    <td><span class="status-p bg-primary">{{ $parcel->status }}</span></td>
                                                    <td>  <a href="{{ route('parcels.edit',$parcel->id) }}">Show</a></td>
                                                   
                        
<td>
                                                    <ul class="d-flex justify-content-center">
                                                        
                                                    <?php 
                                                  $routes = App\Models\Route::where('is_active', true)->get();
                                             ?>
                                                        <form method="POST" action="{{ route('deliverytasks.store') }}">
       @csrf 
      <input type="hidden" value="{{$parcel->id}}" name="parcel">
      
       <div class="form-group">
                                            <label class="col-form-label">Select Route</label>
                                            <select class="form-control" name="route">
                                              
                                          
                                             @foreach($routes as $route)
                                             <option value="{{ $route->id }}">{{ $route->route_name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
      
       <button type="submit">Add to Route</button>
    </form>
                                                    </ul>
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