class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find params[:id]
  end

  def create
    @patient = Patient.new(user_params)
      if @patient.save
        session[:patient_id] = @patient.id
        redirect_to patients_path
      else
        render :new
      end
  end

  def new
    @patient = Patient.new
  end

  # edit action
  def edit
    @patient = Patient.find params[:id]
  end

  # update action
  def update
    @patient = Patient.find params[:id]
    @patient.update_attributes(params.require(:patient).permit(:email, :fname, :lname, :illness, :password))
    flash[:notice] = "Updated!"
    redirect_to edit_patient_path
  end

  # destroy action
  def destroy
    @patient = User.find params[:id]
    @patient.destroy
    redirect_to patients_path
  end


  private 

  def user_params
    params.require(:patient).permit(:email, :fname, :lname, :illness, :password)
  end 

end
