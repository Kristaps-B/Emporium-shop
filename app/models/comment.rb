class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :book
    
    validates :comment, :presence => true
    
    RATINGS = [1, 2, 3, 4, 5]
end
