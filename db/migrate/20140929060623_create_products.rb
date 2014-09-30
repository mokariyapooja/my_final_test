class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :discription
      t.string :quantity

      t.timestamps
    end
  end
end
