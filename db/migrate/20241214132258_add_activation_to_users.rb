class AddActivationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :activation_digest, :string, null: false
    add_column :users, :activated, :boolean, null: false, default: false
    add_column :users, :activated_at, :datetime, null: false
  end
end
