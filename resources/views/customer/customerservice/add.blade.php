<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Add your question</h4>
                                        <form method="POST" action="{{ route('customerservices.store') }}">
                                        @csrf 
                                          
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">question</label>
                                            <input class="form-control" type="text" name="query" id="example-text-input">
                                        </div>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>