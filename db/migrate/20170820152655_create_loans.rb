class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.string :name
      t.references :tariff, foreign_key: true
      t.references :client, foreign_key: true
      t.decimal :amount, precision: 14, scale: 2

      t.timestamps
    end
  end
end
