class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
      t.string :name
      t.text :image
      t.float :islands
      t.float :volume
      t.float :area

      t.timestamps
    end
  end
end
