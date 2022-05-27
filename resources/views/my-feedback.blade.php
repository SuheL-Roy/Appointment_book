@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">My Feedback</div>

                <div class="card-body">

                    <table class="table table-striped">
                        <thead>
                            <tr>

                                <th scope="col">Date</th>
                                <th scope="col">Teacher</th>
                                <th scope="col">Reasone for Appointment</th>
                                <th scope="col">Assignment</th>
                                <th scope="col">Feedback</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($feedbacks as $feedback)
                            <tr>

                                <td>{{$feedback->date}}</td>
                                <td>{{$feedback->teacher->name}}</td>
                                <td>{{$feedback->cause_for_appointment}}</td>
                                <td>{{$feedback->add_task}}</td>
                                <td>{{$feedback->procedure_to_use_medicine}}</td>
                                <td>{{$feedback->comment}}</td>
                            </tr>
                            @empty
                            <td>You have no feedback</td>
                            @endforelse

                        </tbody>
                    </table>


                </div>
            </div>
        </div>
    </div>
</div>
@endsection