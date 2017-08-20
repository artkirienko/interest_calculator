class CreateTariffs < ActiveRecord::Migration[5.1]
  def change
    create_table :tariffs do |t|
      t.string :name
      t.integer :term, limit: 2
      t.decimal :interest, precision: 5, scale: 4
      t.decimal :overdue_interest, precision: 5, scale: 4

      t.timestamps
    end
  end
end
