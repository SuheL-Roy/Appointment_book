<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function index()
    {
        return view('profile.index');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'std_department' => 'required'
        ]);
        User::where('id', auth()->user()->id)
            ->update([
                'name' => $request->name,
                'phone_number' => $request->phone_number,
                'course' => $request->course,
                'std_department' => $request->std_department,
                'address' => $request->address
            ]);
        return redirect()->back()->with('message', 'profile updated');
    }

    public function ProfilePic(Request $request)
    {
        $this->validate($request, ['file' => 'required|image|mimes:jpeg,jpg,png']);
        if ($request->hasFile('file')) {
            $image = $request->file('file');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destination = public_path('/profile');
            $image->move($destination, $name);

            $user = User::where('id', auth()->user()->id)->update(['image' => $name]);

            return redirect()->back()->with('message', 'profile updated');
        }
    }
}
