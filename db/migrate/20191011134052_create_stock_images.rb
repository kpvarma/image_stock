class CreateStockImages < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_images do |t|
      t.string :identifier, :null => false, limit: 32
      t.string :title, :null => true, limit: 256

      t.timestamps
    end
  end
end
