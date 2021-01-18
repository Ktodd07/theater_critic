class Movie < ActiveRecord::Base
    belongs_to :user
    validates_uniqueness_of :title
    has_and_belongs_to_many :reviews
end