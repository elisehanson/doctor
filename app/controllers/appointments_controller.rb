class AppointmentsController < ApplicationController

	def index
    @appointments = Appointment.all
	end

  def create
    @appointment = Appointment.new(user_params)
    @appointment.patient_id = current_patient.id if current_patient
      if @appointment.save
        session[:appointment_id] = @appointment.id
        redirect_to appointments_path
      else
        redirect_to appointments_path
      end
  end

  def destroy
    @appointment = Appointment.find params[:id]
    @appointment.destroy
    redirect_to appointments_path
  end
  
  private 

  def user_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :room, :time) 
  end 

end
