class CreateWorkcategories < ActiveRecord::Migration
  def change
    create_table :workcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
