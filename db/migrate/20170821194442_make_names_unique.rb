class MakeNamesUnique < ActiveRecord::Migration[5.1]
  def change
    add_index :clients, :name, unique: true
    add_index :loans, :name, unique: true
    add_index :tariffs, :name, unique: true
  end
end
