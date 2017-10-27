class CreateGeneratedPairs < ActiveRecord::Migration[5.1]
  def change
    create_table :generated_pairs do |t|
      t.text :pairs, array: true, default: []

      t.timestamps
    end
  end
end
