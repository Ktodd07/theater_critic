class MoviesReviews < ActiveRecord::Migration
  def change
    create_table :movies_reviews do |t|
      t.integer :review_id
      t.integer :movie_id
    end
  end
end
