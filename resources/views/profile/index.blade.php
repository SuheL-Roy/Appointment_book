@extends('layouts.app')

@section('content')
<div class="container">
    @if(Session::has('message'))
        <div class="alert alert-success">{{Session::get('message')}}</div>
        @endif
    <div class="row ">
        
        <div class="col-md-3">
            <div class="card">
                <div class="card-header">User Profile</div>

                <div class="card-body">
                    <p>Name: {{auth()->user()->name}}</p>
                    <p>Email: {{auth()->user()->email }}</p>
                    <p>Student Id: {{auth()->user()->student_id}}</p>
                    <p>Phone Number: {{auth()->user()->phone_number}}</p>
                    <p>Department: {{auth()->user()->std_department}}</p>
                    <p>Bio: {{auth()->user()->course}}</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Update Profile</div>

                <div class="card-body">
                    <form action="" method="post">@csrf
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control @error('name') is-invalid @enderror" value="{{auth()->user()->name}}">
                            @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            
                        </div>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input type="number" name="phone_number" class="form-control" value="{{auth()->user()->phone_number}}">
                            
                        </div>
                        <div class="form-group">
                            <label>Student Id</label>
                            <input type="text" name="student_id" class="form-control" value="{{auth()->user()->student_id}}">
                            
                        </div>
                        <div class="form-group">
                            <label>Department</label>
                            <select name="std_department" class="form-control @error('std_department') is-invalid @enderror">
                                <option value="">select Department</option>
                                <option value="CSE" @if(auth()->user()->std_department==='CSE')selected @endif >CSE</option>
                                <option value="EEE" @if(auth()->user()->std_department==='EEE')selected @endif>EEE</option>
                                <option value="CS" @if(auth()->user()->std_department==='CS')selected @endif >CS</option>
                                <option value="CE" @if(auth()->user()->std_department==='CE')selected @endif>CE</option>
                                <option value="MCE" @if(auth()->user()->std_department==='MCE')selected @endif>MCE</option>
                                <option value="IP" @if(auth()->user()->std_department==='IP')selected @endif>IP</option>
                            </select>
                            @error('std_department')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                       
                            <div class="form-group">
                            <label>bio</label>
                            <textarea name="course" class="form-control">{{auth()->user()->course}}</textarea>
                            
                        </div>
                        <div class="form-group">
                            
                            <button class="btn btn-primary" type="submit">Update</button>
                            
                        </div>
                            
                        </div>
                        
                    </form>
                    
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-header">Update Image</div>
                <form action="{{route('profile.pic')}}" method="post" enctype="multipart/form-data">@csrf
                <div class="card-body">
                    @if(!auth()->user()->image)
                    <img src="../images/H7ldwJViYMehilidPbUH4FLpnypYJxMrBHubAx8c.png" width="120">
                    @else 
                     <img src="/profile/{{auth()->user()->image}}" width="120">
                    @endif
                    <br>
                    <input type="file" name="file" class="form-control" required="">
                    <br>
                     @error('file')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                    <button type="submit" class="btn btn-primary">Update</button>
                    
                </div>
            </form>
            </div>
        </div>

    </div>
</div>
@endsection
