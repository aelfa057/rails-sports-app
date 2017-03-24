class Sport < ActiveRecord::Base
    
    validates :name, presence: :true, uniqueness: :true
    
    has_many :teams
    has_many :matches
    
end
