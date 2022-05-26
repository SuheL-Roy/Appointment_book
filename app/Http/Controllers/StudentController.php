<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use Facade\FlareClient\View;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    public function index(Request $request)
    {
        date_default_timezone_set('Asia/Dhaka');
        if ($request->date) {
            $bookings = Booking::latest()->where('date', $request->date)->get();
            return View('admin.StudentList.index', compact('bookings'));
        }
        $bookings = Booking::latest()->where('date', date('Y-m-d'))->get();
        return View('admin.StudentList.index', compact('bookings'));
    }

    public function ToggleStatus($id){
      $booking = Booking::find($id);
      $booking->status =! $booking->status;
      $booking->save();
      return redirect()->back();
    }

    public function AllTimeAppointment(){
        $bookings = Booking::latest()->paginate(10);
        return View('admin.StudentList.all', compact('bookings'));
    }
}
