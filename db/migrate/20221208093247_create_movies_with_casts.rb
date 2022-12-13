class CreateMoviesWithCasts < ActiveRecord::Migration[6.1]
  def change
    create_table :movies_with_casts do |t|
      t.belongs_to :movie
      t.belongs_to :cast
      t.timestamps
    end
  end
end
