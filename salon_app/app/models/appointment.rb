class Appointment < ActiveRecord::Base
  attr_accessible :beauticianID, :date, :timeslot, :userID, :service_ids, :timeslot, :timeframe
  has_and_belongs_to_many :services

  validates :userID, presence: true
  validates :date, presence: true
  validates :beauticianID, presence: true

end