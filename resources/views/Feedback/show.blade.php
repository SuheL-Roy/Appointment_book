@extends('admin.layouts.master')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
             
              <div class="card-header" >
                  <h1>Appointment Feedback details</h1>
                </div>

                <div class="card-body">
                    <p>Date:{{$feedback->date}}</p>
                    <p>Student:{{$feedback->user->name}}</p>
                    <p>Teacher:{{$feedback->teacher->name}}</p>
                    <p>Reasone for Appointment:{{$feedback->cause_for_appointment}}</p>
                    <p>Assignment:{{$feedback->add_task}}</p>
                    <p>Feedback:{{$feedback->comment}}</p>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
