class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :brand
      t.string :style
      t.string :country
      t.string :quantity

      t.timestamps
    end
  end
end
