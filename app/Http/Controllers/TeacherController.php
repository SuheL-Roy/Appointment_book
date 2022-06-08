<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use function GuzzleHttp\Promise\all;

class TeacherController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       // echo 'welcome';
    //    return Role::all();
    //    dd(Auth::user()->role->name);
       $users = User::where('role_id','!=',3)->get();
       return view('admin.teacher.index',compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.teacher.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validateStore($request);
        $data = $request->all();
        $image = $request->file('image');
        $name = $image->hashName();
        $destination = public_path('/images');
        $image->move($destination,$name);
        $data['image'] = $name;
        $data['password'] = bcrypt($request->password);
        User::create($data);
        return redirect()->back()->with('message','Teacher added successfully');

        // dd($request->all());

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        return view('admin.teacher.delete',compact('user'));
       
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id);
        return view('admin.teacher.edit',compact('user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validateUpdate($request,$id);
        $data = $request->all();
        $user = User::find($id);
        $imageName = $user->image;
        $userPassword =$user->password;
        if($request->hasFile('image')){
            $image = $request->file('image');
            $imageName = $image->hashName();
            $destination = public_path('/images');
            $image->move($destination,$imageName);
        }
        $data['image'] = $imageName;
        if($request->password){
            $data['password'] = bcrypt($request->password);
        }else{
            $data['password'] = $userPassword;
        }
        $user->update($data);
        return redirect()->back()->with('message','Teacher updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(auth()->user()->id == $id){
            abort(401);
       }
       $user = User::find($id);
       $userDelete = $user->delete();
       if($userDelete){
        unlink(public_path('images/'.$user->image));
       }
        return redirect()->route('teacher.index')->with('message','Teacher deleted successfully');
    }

    public function validateStore($request){
        return  $this->validate($request,[
            'name'=>'required',
            'email'=>'required|unique:users',
            'password'=>'required|min:6|max:25',
            'std_department'=>'required',
            'education'=>'required',
            'address'=>'required',
            'department'=>'required',
            'phone_number'=>'required|numeric',
            'image'=>'required|mimes:jpeg,jpg,png',
            'role_id'=>'required',
            'course'=>'required'

       ]);
    }

    public function validateUpdate($request){
        return  $this->validate($request,[
            'name'=>'required',
            // 'email'=>'required|unique:users',
            'std_department'=>'required',
            'education'=>'required',
            'address'=>'required',
            'department'=>'required',
            'phone_number'=>'required|numeric',
            'image'=>'mimes:jpeg,jpg,png',
            'role_id'=>'required',
            'course'=>'required'

       ]);
    }
}
