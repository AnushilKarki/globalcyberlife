@extends('customer.layouts.home')
@section('content')

@foreach($notes as $note)
<div class="col-12 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">Edit note</h4>
                                        <form method="POST" action="{{ route('notes.update',$note->id) }}">
                                        @csrf 
                                        @method('PUT') 
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Title</label>
                                            <input class="form-control" type="text" name="title" value="{{ $note->title }}" id="example-text-input">
                                        </div>
                                            <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Text</label>
                                            <input class="form-control" type="text" id="example-text-input" value="{{ $note->textarea }}"name="note">
                                        </div>
                                      
                                      
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                    @endforeach
@endsection