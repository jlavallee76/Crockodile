class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.decimal :pst_rate
      t.decimal :gst_rate
      t.decimal :hst_rate
      t.text :notes

      t.timestamps
    end

    add_reference :users, :province, null: false, foreign_key: true, default: 1
  end
end
