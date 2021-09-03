@extends('shopadmin.layouts.home')
@section('content')


                                            <p>
                                               @foreach($parcels as $parcel)
                                             parcel id:   {{ $parcel->id }}
                                             grand total :   {{ $parcel->total_amount_collection }}
                                               @endforeach
                                            
                                             
                                               </p>
                                           
                    
@endsection