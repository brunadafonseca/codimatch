class AddAttributesToPairs < ActiveRecord::Migration[5.1]
  def change
    add_column :pairs, :date, :datetime
    add_column :pairs, :student_1_id, :integer
    add_column :pairs, :student_2_id, :integer
  end
end
