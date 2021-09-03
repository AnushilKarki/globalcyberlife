@extends('shopadmin.layouts.home')
@section('content')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Returns </h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                              
                                                <th scope="col">ID</th>
                                                    <th scope="col">order id</th>
                                                    <th scope="col">Type</th>
                                                    <th scope="col">Reason</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">Response</th>
                                                
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($returns as $return)
                                                <tr>
                                                <th scope="row">{{ $return->id }}</th>
                                                    <td>{{ $return->orderid }}</td>
                                                    <td>{{ $return->type }}</td>
                                                 
                                                  
                                                    <td>{{ $return->reason }}</td>
                                                    <td>
                                               {{ $return->status }}
                                                    </td>
                                                  
                                                  
                                                    <td>
                                                        <ul class="d-flex justify-content-center">
                                                        <a href="{{ route('shoporderreturns.edit',$return->id) }}">Response</a>  
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
                    <div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Exchange </h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">order id</th>
                                                    <th scope="col">Type</th>
                                                    <th scope="col">Reason</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">Response</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($exchanges as $exchange)
                                                <tr>
                                                    <th scope="row">{{ $exchange->id }}</th>
                                                    <td>{{ $exchange->orderid }}</td>
                                                    <td>{{ $exchange->type }}</td>
                                                 
                                                  
                                                    <td>{{ $exchange->reason }}</td>
                                                    <td>
                                               {{ $exchange->status }}
                                                    </td>
                                                    <td>
                                                        <ul class="d-flex justify-content-center">
                                                        <a href="{{ route('shoporderreturns.edit',$exchange->id) }}">Response</a>  
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