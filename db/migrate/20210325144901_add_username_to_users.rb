class AddUsernameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :postal, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
  end
end
