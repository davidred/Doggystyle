class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.integer :from, null: false
      t.integer :to, null: false

      t.timestamps
    end
    
    add_index :messages, :to
    add_index :messages, :from
  end
end
