class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.text :description
      t.string :age_range
      t.decimal :price

      t.timestamps
    end
  end
end
