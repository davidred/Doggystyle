class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|

      t.integer :visitor, null: false
      t.integer :visited, null: false

      t.timestamps
    end
    
    add_index :visits, :visitor
    add_index :visits, :visited
  end
end
