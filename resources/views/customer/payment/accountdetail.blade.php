

<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Payment Account Details</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">particular</th>
                                                    <th scope="col">Account Name</th>
                                                    <th scope="col">Account no</th>
                                                    <th scope="col">Phone no</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($accounts as $account)
                                                <tr>
                                                    <th scope="row">{{ $account->id }}</th>
                                                    <td>{{ $account->particular }}</td>
                                                    <td>{{ $account->account_name }}</td>
                                                    <td>{{ $account->account_no }}</td>
                                                    <td>{{ $account->phone_no }}</td>
                                                   
                                                </tr>
                                              @endforeach
                                             
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

