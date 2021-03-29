class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.boolean :dairy_free,  default: false
      t.boolean :gluten_free, default: false
      t.boolean :kosher,      default: false
      t.boolean :peanut_free, default: false
      t.boolean :vegan,       default: false
      t.boolean :vegetarian,  default: false
      t.boolean :available,   default: true
      t.boolean :featured,    default: false

      t.timestamps
    end
  end
end
