class Match < ActiveRecord::Base
    belongs_to :user
    has_many :team
    
    validates :user_id, presence: true
end