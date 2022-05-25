<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use App\Models\Time;
use App\Models\User;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function index(){
       
       //dd(date('Y-m-d'));
       date_default_timezone_set('Asia/Dhaka');
       if(request('date')){
          $teachers = $this->teacherBasedOnDate(request('date'));
           return view('welcome',compact('teachers'));
       }
       $teachers = Appointment::where('date',date('Y-m-d'))->get();
      // return $teachers; 
       return view('welcome',compact('teachers'));
    }

    public function show($teacherId,$date){
        $appointment = Appointment::where('user_id',$teacherId)->where('date',$date)->first();
        $times = Time::where('appointment_id',$appointment->id)->where('status',0)->get();
        // return $times;
        $user = User::where('id',$teacherId)->first();
        return view('appointment',compact('times','date','user'));
    }

    public function teacherBasedOnDate($date){
        $teacher = Appointment::where('date',$date)->get();
        return $teacher;
    }
}
