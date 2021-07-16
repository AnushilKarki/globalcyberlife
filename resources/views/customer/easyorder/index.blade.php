@extends('customer.layouts.home')
@section('content')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Easy Orders Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">product</th>
                                                    <th scope="col">Address</th>
                                                    <th scope="col">Phoneno</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($easyorders as $easyorder)
                                                <tr>
                                                    <th scope="row">{{ $easyorder->id }}</th>
                                                    <td>{{ $easyorder->product_id }}</td>
                                                    <td>{{ $easyorder->address }}</td>
                                                    <td>
                                                       {{ $easyorder->phone_no }}
                                                    </td>
                                                    <td><span class="status-p bg-primary"> {{ $easyorder->status }}</span></td>
                                                    <td>
                                                    <ul class="d-flex justify-content-center">
                                                        
                                                        
                                                        <form method="POST" action="{{ route('easyorders.update',$easyorder->id) }}">
       @csrf 
       @method('PUT')
      
       
      
       <button type="submit">cancel order</button>
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