class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :review_title
      t.string :review_body
      t.integer :accesibility_rating
      t.string :accesibility_features
      t.integer :business_id
      t.integer :user_id

      t.timestamps
    end
  end
end
