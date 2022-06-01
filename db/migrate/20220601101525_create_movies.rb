class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.string :discription
      t.string :director
      t.integer :price

      t.timestamps
    end
  end
end
