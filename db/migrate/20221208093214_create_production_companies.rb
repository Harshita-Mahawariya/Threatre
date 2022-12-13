class CreateProductionCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :production_companies do |t|
      t.string :name
      t.string :turnover
      t.timestamps
    end
  end
end
