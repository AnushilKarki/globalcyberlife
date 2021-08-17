@extends('employee.layouts.home')
@section('content')

<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Delivery Tasks</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                   
                                                    <th scope="col">task_id</th>
                                                    <th scope="col">Route name</th>
                                                  
                                                    <th scope="col">Rider Earning</th>
                                                    <th scope="col">status</th>
                                                    
                                                    <th scope="col"> Action</th>
                                                    <th scope="col">show</th>
                                                   
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($tasks as $task)
                                       
                                                <tr>
                                                    <th>{{ $task->id }}</th>
                                                    <td> {{ $task->route_name }} </td>
                                                    <td>Rs {{ $task->rider_earning }}</td>
                                                   
                                                   
                                                    <td><span class="status-p bg-primary">{{ $task->task_status }}</span></td>
                                                    <td>  <a href="{{ route('updatetasks.edit',$task->id) }}">Complete/Cancel</a></td>
                                                    <td>  <a href="{{ route('ridertasks.show',$task->delivery_id) }}">Show</a></td>

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