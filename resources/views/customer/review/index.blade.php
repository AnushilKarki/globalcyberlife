@extends('customer.layouts.home')
@section('content')
@include('customer.review.add')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Review Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">rating</th>
                                                    <th scope="col">Review</th>
                                                 
                                                    <th scope="col">type</th>
                                                    <th scope="col">edit</th>
                                                    <th scope="col">delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($reviews as $complain)
                                                <tr>
                                                    <th scope="row">{{ $complain->id }}</th>
                                                    <td>{{ $complain->rating }}</td>
                                                    <td>{{ $complain->review }}</td>
                                                    <td>{{ $complain->type }}</td>
                                                    <td>  <a href="{{ route('shopratings.edit',$complain->id) }}">Edit</a>  </td>
                                                    <td>
                                                        <ul class="d-flex justify-content-center">
                                                        <form method="POST" action="{{ route('shopratings.destroy',$complain->id) }}">
       @csrf 
   
    @method('DELETE')
       <button type="submit">delete</button>
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
