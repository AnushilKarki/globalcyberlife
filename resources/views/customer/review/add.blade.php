<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Review form</h4>
                                        <form method="POST" action="{{ route('shopratings.store') }}">
                                        @csrf 
                                          
                                           
                                      <h2>  <label for="cars">Review for service:</label></h2>

<h2><select name="type" id="colors">
   
  <option value="shopping">shopping</option>
  <option value="delivery">delivery</option>
  <option value="gift">gift</option>

</select>                         
</h2>
<div class="star-rating">
      <input type="radio" name="rating" id="star-a" value="5"/>
      <label for="star-a"></label>

      <input type="radio" name="rating" id="star-b" value="4"/>
      <label for="star-b"></label>
  
      <input type="radio" name="rating" id="star-c" value="3"/>
      <label for="star-c"></label>
  
      <input type="radio" name="rating" id="star-d" value="2"/>
      <label for="star-d"></label>
  
      <input type="radio" name="rating" id="star-e" value="1"/>
      <label for="star-e"></label>
</div>
                                       
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Review</label>
                                            <input class="form-control" type="text" id="example-text-input" name="review">
                                        </div>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>