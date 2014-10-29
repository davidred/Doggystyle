class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :user, index: true, null: false
      t.string :preference_attribute, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
