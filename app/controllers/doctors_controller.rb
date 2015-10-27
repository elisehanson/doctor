class DoctorsController < ApplicationController

	def index
    	@doctors = Doctor.all
	end

  def create
    @doctor = Doctor.new(doctor_params)
      if @doctor.save
        session[:doctor_id] = @doctor.id
        redirect_to doctors_path
      else
        redirect_to doctors_path
      end
  end

  def new
    @doctor = Doctor.new
  end


  def edit
    @doctor = Doctor.find params[:id]
  end

  def update
    @doctor = Doctor.find params[:id]
    @doctor.update_attributes(params.require(:doctor).permit(:fname, :lname, :specialty))
    redirect_to doctors_path


  end


  def destroy
    @doctor = Doctor.find params[:id]
    @doctor.destroy
    redirect_to doctors_path
  end



  private 

  def doctor_params
    params.require(:doctor).permit(:fname, :lname, :specialty, :password)
  end 

end
