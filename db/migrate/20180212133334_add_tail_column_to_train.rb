class AddTailColumnToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :tail, :boolean, default: false
  end
end
