@extends('shopadmin.layouts.home')
@section('content')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Delivery Tasks Verification</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">route_id</th>
                                                    <th scope="col">Rider Earning</th>
                                                    <th scope="col"> Reason</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">Verify</th>
                                                    <th scope="col">show</th>
                                                   
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($tasks as $task)
                                       
                                                <tr>
                                                    <th scope="row">{{ $task->id }}</th>
                                                    <td> {{ $task->route_name }} </td>
                                                    <td>{{ $task->rider_earning }}</td>
                                                    <td>{{ $task->reason }}</td>
                                                   
                                                    <td><span class="status-p bg-primary">{{ $task->task_status }}</span></td>
                                                    <td>  <a href="{{ route('deliverytasks.action',$task->id) }}">verify</a></td>
                                                    <td>  <a href="{{ route('deliverytasks.edit',$task->delivery_id) }}">Show</a></td>

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
                                <h4 class="header-title">Failed Delivery Tasks Verification</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">route_id</th>
                                                    <th scope="col">Rider Earning</th>
                                                    <th scope="col"> Reason</th>
                                                    <th scope="col">status</th>
                                                    <th scope="col">Verify</th>
                                                    <th scope="col">show</th>
                                                   
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($failedtasks as $task)
                                       
                                                <tr>
                                                    <th scope="row">{{ $task->id }}</th>
                                                    <td> {{ $task->route_name }} </td>
                                                    <td>{{ $task->rider_earning }}</td>
                                                    <td>{{ $task->reason }}</td>
                                                   
                                                    <td><span class="status-p bg-primary">{{ $task->task_status }}</span></td>
                                                    <td>  <a href="{{ route('deliverytasks.action',$task->id) }}">verify</a></td>
                                                    <td>  <a href="{{ route('deliverytasks.edit',$task->delivery_id) }}">Show</a></td>

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