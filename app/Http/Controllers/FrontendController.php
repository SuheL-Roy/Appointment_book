<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use App\Models\Booking;
use App\Models\Time;
use App\Models\User;
use Illuminate\Auth\Events\Validated;
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
        $teacher_id = $teacherId;
        return view('appointment',compact('times','date','user','teacher_id'));
    }

    public function teacherBasedOnDate($date){
        $teacher = Appointment::where('date',$date)->get();
        return $teacher;
    }

    public function store(Request $request){

        date_default_timezone_set('Asia/Dhaka');

        $check = $this->checkBookingTimeInterval();
        if($check){
            return redirect()->back()->with('errmessage','You have already booked in an appointment.Please wait to make next appointment');
        }
        $request->validate(['time'=>'required']);
        Booking::create([
          'user_id' => auth()->user()->id,
          'teacher_id' => $request->teacherId,
          'time' => $request->time,
          'date' => $request->date,
          'status'=> 0,
        ]);
       
        Time::where('appointment_id',$request->appointmentId)
        ->where('time',$request->time)->update(['status'=>1]);
        return redirect()->back()->with('message','your appointment was booked');
    }

    public function checkBookingTimeInterval(){

        return Booking::orderby('id','desc')
        ->where('user_id',auth()->user()->id)
        ->whereDate('created_at',date('Y-m-d'))
        ->exists();
    }

    public function myBooking(){
        $appointments = Booking::latest('user_id',auth()->user()->id)->get();
        return view('booking.index',compact('appointments'));
    }

    public function TeacherToady(Request $request){
        $teachers = Appointment::with('teacher')->whereDate('date',date('Y-m-d'))->get();
        return $teachers;
    }

    public function FindTeacher(Request $request){
        $teachers = Appointment::with('teacher')->whereDate('date',$request->date)->get();
        return $teachers;

    }
}
