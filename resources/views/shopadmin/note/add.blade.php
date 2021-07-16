<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Add note</h4>
                                        <form method="POST" action="{{ route('notes.shop.store') }}">
                                        @csrf 
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Title</label>
                                            <input class="form-control" type="text" name="title" id="example-text-input">
                                        </div>
                                            <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Text</label>
                                            <input class="form-control" type="text" id="example-text-input" name="text">
                                        </div>
                                      
                                      
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>