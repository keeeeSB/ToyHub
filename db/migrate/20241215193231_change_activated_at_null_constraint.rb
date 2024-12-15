class ChangeActivatedAtNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :activated_at, true
  end
end
