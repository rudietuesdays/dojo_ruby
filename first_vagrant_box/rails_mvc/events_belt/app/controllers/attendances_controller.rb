class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(user: current_user, event_id: params[:id])
    @attendance.save
    redirect_to :back
  end

  def destroy
    event = Event.find(params[:id])
    @attendance = Attendance.find_by(event: event, user: current_user)
    @attendance.destroy if current_user === @attendance.user
    redirect_to :back
  end
end
