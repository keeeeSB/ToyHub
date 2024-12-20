class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
