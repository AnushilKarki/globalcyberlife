<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Easyorder form</h4>
                                        <form method="POST" action="{{ route('easyorders.store') }}">
                                        @csrf 
                                        <div class="form-group">
                                        @php
                                       
                                        $prods= App\Models\Product::where('is_active',1)->get();
                                    @endphp
                                    <label for="cars">Choose a product:</label>

<select name="product" id="colors">
    @foreach($prods as $color)
  <option value="{{ $color->id }}">{{ $color->name }}</option>
@endforeach 
</select>
                                        </div>

                                  
										
                                            <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Address</label>
                                            <input class="form-control" type="text" id="example-text-input" name="address">
                                        </div>
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Phoneno</label>
                                            <input class="form-control" type="text" id="example-text-input" name="phoneno">
                                        </div>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>