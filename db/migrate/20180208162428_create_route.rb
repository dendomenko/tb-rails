class CreateRoute < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :name
    end
  end
end
