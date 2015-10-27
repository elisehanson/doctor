class Appointment < ActiveRecord::Base
	
	belongs_to :doctor
	belongs_to :patient

  def self.listing(page)
    order(created_at: :desc).page(params[:page]).per(20)
  end

end
