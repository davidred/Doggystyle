class AddGenderBreedLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer, null: false
    add_column :users, :breed, :integer, null: false
    add_column :users, :email, :string, null: false
    add_column :users, :country, :integer, null: false
    add_column :users, :zip, :integer, null: false

    add_index :users, :email
  end
end
