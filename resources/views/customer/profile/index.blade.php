@extends('customer.layouts.home')
@section('content')
<form action="{{ route('user-password.update') }}" method="POST">
       @csrf 
    @method('PUT')
    @if(session('status')=="password-updated")
      <div class="alert alert-success">
          password updated successfully
      </div>
    @endif
       <div class="current_password">
          <label for="current_password">current password</label>
          <input type="password" id="current_password" name="current_password" class="form-control @error('current_password','updatePassword') is-invalid @enderror" autofocus>
         @error('current_password','updatePassword')
              <span class="invalid-feedback" role="alert">
          {{$message}}
         @enderror
       </div>
       <div class="password">
          <label for="password">new password</label>
          <input type="password" id="password" name="password" class="form-control @error('password','updatePassword') is-invalid @enderror">
          @error('password','updatePassword')
              <span class="invalid-feedback" role="alert">
          {{$message}}
         @enderror
       </div>
       <div class="password_confirmation">
          <label for="password_confirmation">password_confirmation</label>
          <input type="password" class="form-control" id="password_confirmation" name="password_confirmation">
       </div>
    <br>
       <button class="form-control">submit</button>
       </div>
    </form>
@endsection