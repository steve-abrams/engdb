class Gage < ActiveRecord::Base
  attr_accessible :calibration_date, :calibration_period, :description, :gage_number, :gage_type, :location, :rating, :servicing_company, :servicing_phone

  validates :gage_number, :gage_type, :description, :rating, :calibration_date, :calibration_period, presence: true
  validates :gage_number, uniqueness: true

  GAGE_TYPES = [ "Pressure Gage", "Torque Meter", "Flow Meter", "Dead Weight", "Vibration" ]
  PERIOD = [ "Yearly", "Every 3 Years", "Monthly" ]
end
