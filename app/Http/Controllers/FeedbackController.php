<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Feedback;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{
   public function index(){
    date_default_timezone_set('Asia/Dhaka');
    $bookings = Booking::where('date',date('Y-m-d'))->where('status',1)->where('teacher_id',auth()->user()->id)->get();

    return view('Feedback.index',compact('bookings'));

   }

   public function store(Request $request){
      $data = $request->all();
     $data['add_task'] = implode(',',$request->add_task);
     Feedback::create($data);
     return redirect()->back()->with('message',"Feedback created");
   }

   public function show($userId,$date){
      $feedback = Feedback::where('user_id',$userId)->where('date',$date)->first();
      //return $feedback;
      return view('Feedback.show',compact('feedback'));
   }
}
