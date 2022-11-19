class StudentsController < ApplicationController
  def index
    @students = Student.all;
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  def new
    @student = Student.new
  end

  def create
    #@student = Student.new(lastname: "1", group: "1", geom: 1, alg: 1, inf: 1, winter_session_id: 1)
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  private
  def student_params
    params.require(:student).permit(:lastname, :group, :geom, :alg, :inf, :winter_session_id)
  end

end
