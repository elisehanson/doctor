class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


   helper_method :current_patient
 
   def current_patient
     @current_patient ||= Patient.find(session[:patient_id]) if session[:patient_id]
   end 

end
