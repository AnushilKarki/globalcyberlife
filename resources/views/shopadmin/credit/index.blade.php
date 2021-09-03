@extends('shopadmin.layouts.home')
@section('content')
<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Credit Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                  <th scope="col">user name</th>
                                                    <th scope="col">credit limit</th>
                                                    <th scope="col">credit amount</th>
                                                    <th scope="col">debit amount</th>
                                                    <th scope="col">status</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($credits as $credit)
                                            <?php
                    $username = App\Models\User::where('id', $credit->user_id)->pluck('name');
                ?>
                                                <tr>
                                                    <th scope="row">1</th>
                                           
                                                    <td>{{ $username }}</td>
                                         
                                                    <td>{{ $credit->credit_limit }}</td>
                                                    <td>{{ $credit->credit_amount }}</td>
                                                    <td>
                                                      {{ $credit->debit_amount }}
                                                    </td>
                                                    <td><span class="status-p bg-primary">{{ $credit->status }}</span></td>
                                                  
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