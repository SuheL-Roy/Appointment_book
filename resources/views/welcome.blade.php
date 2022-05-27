@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <img src="https://images.unsplash.com/photo-1522241112606-b5d35a468795?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870" class="img-fluid" style="border:1px solid #ccc;">
        </div>
        <div class="col-md-6">
            <h2>Create an account & Book your appointment</h2>
            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p>
            <div class="mt-5">
                <a href="{{url('/register')}}"> <button class="btn btn-success">Register as Patient</button></a>
                <a href="{{url('/login')}}"><button class="btn btn-secondary">Login</button></a>
                <!-- <a href=""> <button class="btn btn-success">Register as Student</button></a>
                <a href=""><button class="btn btn-secondary">Login</button></a> -->
            </div>
        </div>
    </div>
    <hr>
    <!-- <form action="{{url('/')}}" method="GET">
        <div class="card">
            <div class="card-header">Find Teachers</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-8">
                        <input type="text" class="form-control " id="datepicker" name="date">
                    </div>
                    <div class="col-sm-4">
                        <button class="btn btn-primary">Find Teachers</button>
                    </div>

                </div>
            </div>

        </div>
        </form> -->

    <!-- <div class="card mt-1">
            <div class="card-header"> Teachers available today</div>
            <div class="card-body">

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Photo</th>
                            <th scope="col">Name</th>
                            <th scope="col">Expertise</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($teachers as $teacher)
                        <tr>
                            <td><img src="{{asset('images')}}/{{$teacher->teacher->image}}" width="80" style="border-radius: 50%;">
                            </td>
                            <td>{{$teacher->teacher->name}}</td>
                            <td>{{$teacher->teacher->department}}</td>
                            <td>
                               <a href="{{route('create.appointment',[$teacher->user_id,$teacher->date])}}"><button class="btn btn-success">Book Appointment</button> </a>
                            </td>
                        </tr>
                        @empty
                        <td>No Teacher available todays </td>
                        @endforelse
                    </tbody>
                </table>


            </div>

        </div> -->

        <!-- date picker component -->

    <find-teacher></find-teacher>
        

</div>
@endsection