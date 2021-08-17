@extends('employee.layouts.home')
@section('content')


                                            <p>
                                               @foreach($parcels as $parcel)
                                             parcel id:   {{ $parcel->id }}<br>
                                             grand total :   {{ $parcel->total_amount_collection }}<br>
                                             shipment id : {{ $parcel->track }}<br>
                                             pickup address :   {{ $parcel->pickup_address }}<br>
                                             pickup contact no : {{ $parcel->pickup_contact_no }}<br>
                                             delivery address :   {{ $parcel->delivery_address }}<br>
                                             delivery contact no : {{ $parcel->delivery_contact_no }}<br>
                                             delivery charge : {{ $parcel->delivery_charge }}
                                               @endforeach
                                            
                                             
                                               </p>
                                           
                    
@endsection