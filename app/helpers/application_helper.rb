module ApplicationHelper


 
   def current_patient
     @current_patient ||= Patient.find(session[:patient_id]) if session[:patient_id]
   end 


end
