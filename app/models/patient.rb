class Patient < ActiveRecord::Base

	 has_many :appointments
	 has_many :doctors, through: :appointments

	 	 	has_secure_password

def self.authenticate(email, password)
end

	 validates :email, presence: true, uniqueness: true
	 validates :fname, presence: { message: ", what's your name?"}
	 validates :illness, presence: { message: ", what's wrong?"}
	 validates :password, confirmation: true, presence: true, length: {minimum: 4, maximum: 30}
 

	after_save :new_patient_haiku

 	def new_patient_haiku 
 	 Rails.logger.info( 
 	 	"""""
 	 	uh oh 911
		new patient alive or dead
		hospital break room
		!!!
		"""""
	  	)
 	end

end