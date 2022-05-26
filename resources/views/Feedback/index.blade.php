namespace App\Models\Feedback;
@extends('admin.layouts.master')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                @if(Session::has('message'))
                <div class="alert alert-success">
                    {{Session::get('message')}}
                </div>
                @endif
                <div class="card-header">

                    Appointment ({{$bookings->count()}})
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Photo</th>
                                <th scope="col">Date</th>
                                <th scope="col">User</th>
                                <th scope="col">Email</th>
                                <!-- <th scope="col">Phone</th> -->
                                <th scope="col">Dep</th>

                                <th scope="col">Time</th>
                                <th scope="col">Teacher</th>
                                <th scope="col">Status</th>
                                <th scope="col">Feedback</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($bookings as $key=>$booking)
                            <tr>
                                <td scope="row">{{$key+1}}</td>
                                <td><img src="/profile/{{$booking->user->image}}" width="80" style="border-radius: 50%;">
                                </td>
                                <td>{{$booking->date}}</td>
                                <td>{{$booking->user->name}}</td>
                                <td>{{$booking->user->email}}</td>
                                <!-- <td>{{$booking->user->phone_number}}</td> -->
                                <td>{{$booking->user->std_department}}</td>
                                <td>{{$booking->time}}</td>
                                <td>{{$booking->teacher->name}}</td>
                                <td>
                                    @if($booking->status==1)
                                    checked
                                    @endif
                                </td>
                                <td>
                                    @if(!App\Models\Feedback::where('date',date('Y-m-d'))->where('teacher_id',auth()->user()->id)->where('user_id',$booking->user->id)->exists())
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal{{$booking->user_id}}">
                                        Write Feedback </button>
                                    @include('Feedback.form');
                                    @else
                                    
                                    <a href="{{route('feedback.show',[$booking->user_id,$booking->date])}}" class="btn btn-secondary">View Feedback</a>
                                    @endif
                                </td>
                            </tr>
                            @empty
                            <td>There is no any appointments todays !</td>
                            @endforelse

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{{asset('js/app.js')}}"defer></script>
@endsection