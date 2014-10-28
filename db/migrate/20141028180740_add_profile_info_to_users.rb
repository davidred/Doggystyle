class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :summary, :text
    add_column :users, :photo, :string
    add_column :users, :age, :integer
    add_column :users, :size, :integer
    add_column :users, :play_style, :integer
    add_column :users, :energy_level, :integer
    add_column :users, :looking_for_size, :integer
    add_column :users, :looking_for_breed, :integer
    add_column :users, :looking_for_gender, :integer
    add_column :users, :looking_for_distance, :integer
    add_column :users, :looking_for_location, :integer
    add_column :users, :owner_name, :string
    add_column :users, :owner_photo, :string
    add_column :users, :owner_gender, :integer
    add_column :users, :owner_age, :integer

    add_index :users, :breed
    add_index :users, :size
    add_index :users, :gender
  end
end
