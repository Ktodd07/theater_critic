class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :movie
      t.string :review
      t.integer :user_id
    end
  end
end
