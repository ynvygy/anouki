class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :name
      t.text :description
      t.references :workcategory, index: true
      t.timestamps
    end
  end
end
