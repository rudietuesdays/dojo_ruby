class EventsController < ApplicationController

  def index
    @user = current_user
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = ["Event successfully created"]
      redirect_to "/events/#{@event.id}"
    else
      flash[:notice] = @event.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
    @comments = @event.comments.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to "/events/#{@event.id}"
    else
      flash[:notice] = @event.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @user = current_user
    @event = Event.find(params[:id])
    if @event.user.id == @user.id
      @event.destroy
      redirect_to "/events"
    else
      flash[:notice] = @event.errors.full_messages
      redirect_to :back
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :city, :state).merge(user: current_user)
  end
end
