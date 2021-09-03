@extends('shopadmin.layouts.home')
@section('content')

<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Complins Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Complain</th>
                                                 
                                                    <th scope="col">status</th>
                                                    <th scope="col">response</th>
                                                    <th scope="col">Message</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($complains as $complain)
                                                <tr>
                                                    <th scope="row">{{ $complain->id }}</th>
                                                    <td>{{ $complain->title }}</td>
                                                    <td>{{ $complain->complain }}</td>
                                                    <td>{{ $complain->status }}</td>
                                                    <td>  <a href="{{ route('complains.shopedit',$complain->id) }}">Edit</a>  </td>
                                                   <td>{{ $complain->message }}</td>
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
