class Match < ActiveRecord::Base
  belongs_to :team
  belongs_to :team
  belongs_to :phase
  has_many :selecteds
end
