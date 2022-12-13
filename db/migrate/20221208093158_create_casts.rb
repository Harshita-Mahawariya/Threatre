class CreateCasts < ActiveRecord::Migration[6.1]
  def change
    create_table :casts do |t|
      t.string :name
      t.integer :mobile_number
      t.integer :experience
      t.integer :number_of_movies
      t.timestamps
    end
  end
end
