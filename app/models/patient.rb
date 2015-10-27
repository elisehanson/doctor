class Patient < ActiveRecord::Base

	 has_many :appointments   
	 has_many :doctors, through: :appointments

	 	 	has_secure_password

def self.authenticate(email, password)
end

	 validates_presence_of :fname, :lname, :illness, :password
	 validates :password, confirmation: true, presence: true

end