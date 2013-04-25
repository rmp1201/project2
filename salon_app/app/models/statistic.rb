class Statistic < ActiveRecord::Base
   attr_accessible :rebooks, :lost


  validates :rebooks, presence: true
  validates :lost, presence: true
end
