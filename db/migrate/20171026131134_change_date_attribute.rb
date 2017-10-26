class ChangeDateAttribute < ActiveRecord::Migration[5.1]
  def change
    change_column :pairs, :date, :date
  end
end
