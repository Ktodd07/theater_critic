class Review < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :movie, :review
    has_and_belongs_to_many :movies
end