class Doctor < ActiveRecord::Base
	
# attr_accessible :fname, :lname, :specialty, :password
	
 	has_many :appointments   
 	has_many :patients, through: :appointments

end

