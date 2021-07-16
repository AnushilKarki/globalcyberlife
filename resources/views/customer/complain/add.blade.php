<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">complain form</h4>
                                        <form method="POST" action="{{ route('complains.store') }}">
                                        @csrf 
                                          
                                            <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Title</label>
                                            <input class="form-control" type="text" id="example-text-input" name="title">
                                        </div>
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Complain</label>
                                            <input class="form-control" type="text" id="example-text-input" name="complain">
                                        </div>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>