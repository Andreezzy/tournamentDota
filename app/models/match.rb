class Match < ActiveRecord::Base
  #belongs_to :team
  belongs_to :phase
  belongs_to :team_1, :class_name => 'Team', :foreign_key => 'team_1_id'
  belongs_to :team_2, :class_name => 'Team', :foreign_key => 'team_2_id'
  has_many :selecteds
end
