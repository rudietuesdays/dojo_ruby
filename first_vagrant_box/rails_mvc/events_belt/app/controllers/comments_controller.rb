class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:id])
    @comment = Comment.new(content: params[:content], user: current_user, event: @event)
    if @comment.save
      flash[:notice] = ["Comment successfully created"]
      redirect_to "/events/#{@event.id}"
    else
      flash[:notice] = @comment.errors.full_messages
      redirect_to :back
    end
  end
end
