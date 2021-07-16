@extends('shopadmin.layouts.home')
@section('content')
@include('shopadmin.note.add')
@foreach($notes as $note)
<div class="col-lg-6 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">{{ $note->title }}</h4>
                              
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary btn-flat btn-lg mt-3" data-toggle="modal" data-target="#exampleModalLong">view</button>
                                <form method="POST" action="{{ route('notes.destroy',$note->id) }}">
       @csrf 
   
    @method('DELETE')
    <button type="submit" class="btn btn-primary btn-flat btn-lg mt-3" >Delete</button>
    </form>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModalLong">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                        <form method="POST" action="{{ route('notes.shop.update',$note->id) }}">
                                        @csrf 
       @method('PUT') 
       <input type="hidden" value="{{$note->id}}" name="noteid">
    
       <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Title</label>
                                            <input class="form-control" type="text" value="{{ $note->title }}"id="example-text-input" name="title">
                                        </div>
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">note</label>
                                            <input class="form-control" type="text" id="example-text-input" value="{{ $note->textarea }}" name="note">
                                        </div>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">save</button>
                                        </form>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
@endsection