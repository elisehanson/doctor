class SessionsController < ApplicationController

  def new
    @patients = Patient.all
  end

  def create
    puts params[:email]
    patient = Patient.find_by_email(params[:session][:email])
    if patient && patient.authenticate(params[:session][:password])
      flash[:notice] = "You've been logged in."
      session[:patient_id] = patient.id
      redirect_to patients_path
    else
      render 'new'
      flash[:alert] = "There was a problem logging you in."
    end 
  end 

  def destroy
    session[:patient_id] = nil
    redirect_to root_url, notice: "Logged out."
  end

end
