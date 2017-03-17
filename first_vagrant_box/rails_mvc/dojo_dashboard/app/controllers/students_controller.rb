class StudentsController < ApplicationController
  def index
    @dojo = Dojo.find(params[:dojo_id])
    @students = Student.where(dojo: @dojo.id)
  end

  def new
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to "/dojos/#{@student.dojo_id}", notice: "You have successfully created a student!"
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @student = Student.with_dojo(params[:id])
    @cohort = Student.cohort(@student)
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end

end
