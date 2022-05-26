@if(count($bookings)>0)
<div class="modal fade" id="exampleModal{{$booking->user_id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form action="{{route('teacher.feedback')}}" method="post">@csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Appointment Feedback</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="app">

                    <input type="hidden" name="user_id" value="{{$booking->user_id}}">
                    <input type="hidden" name="teacher_id" value="{{$booking->teacher_id}}">
                    <input type="hidden" name="date" value="{{$booking->date}}">

                    <div class="form-group">
                        <label>Reasone for Appointment</label>
                        <input type="text" name="cause_for_appointment" class="form-control" required="">
                    </div>


                    <div class="form-group">
                        <label>Add Assignment</label>
                        <!-- <add-btn></add-btn> -->
                        <add-btn></add-btn>

                    </div>

                    <div class="form-group">
                        <label>Feedback</label>

                        <textarea name="comment" class="form-control" placeholder="feedback" required=""></textarea>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
        </form>
    </div>
</div>
@endif