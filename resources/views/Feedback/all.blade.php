namespace App\Models\Feedback;
@extends('admin.layouts.master')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                @if(Session::has('message'))
                <div class="alert alert-success">
                    {{Session::get('message')}}
                </div>
                @endif
                <div class="card-header">

                    Appointment ({{$students->count()}})
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
                            @forelse($students as $key=>$student)
                            <tr>
                                <td scope="row">{{$key+1}}</td>
                                <td><img src="/profile/{{$student->user->image}}" width="80" style="border-radius: 50%;">
                                </td>
                                <td>{{$student->date}}</td>
                                <td>{{$student->user->name}}</td>
                                <td>{{$student->user->email}}</td>
                                <!-- <td>{{$student->user->phone_number}}</td> -->
                                <td>{{$student->user->std_department}}</td>
                                <td>{{$student->time}}</td>
                                <td>{{$student->teacher->name}}</td>
                                <td>
                                    @if($student->status==1)
                                    checked
                                    @endif
                                </td>
                                <td>


                                    <a href="{{route('feedbacked.show',[$student->user_id,$student->date])}}" class="btn btn-secondary">View Feedback</a>

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
<script src="{{asset('js/app.js')}}" defer></script>
@endsection