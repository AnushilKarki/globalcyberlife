@extends('customer.layouts.home')
@section('content')
@include('customer.note.add')


<div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Notes Table</h4>
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-hover progress-table text-center">
                                            <thead class="text-uppercase">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">note</th>
                                                 
                                                  
                                                    <th scope="col">edit</th>
                                                    <th scope="col">delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($notes as $note)
                                                <tr>
                                                    <th scope="row">{{ $note->id }}</th>
                                                    <td>{{ $note->title }}</td>
                                                    <td>{{ $note->textarea }}</td>

                                                    <td>  <a href="{{ route('notes.edit',$note->id) }}">Edit</a>  </td>
                                                    <td>
                                                        <ul class="d-flex justify-content-center">
                                                        <form method="POST" action="{{ route('notes.destroy',$note->id) }}">
       @csrf 
   
    @method('DELETE')
       <button type="submit">delete</button>
    </form>
                                                        </ul>
                                                    </td>
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