class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :budget
      t.string :duration
      t.belongs_to :production_company
      t.timestamps
    end
  end
end
