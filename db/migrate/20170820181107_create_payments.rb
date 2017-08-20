class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :loan, foreign_key: true
      t.decimal :base, precision: 14, scale: 2
      t.decimal :interest, precision: 14, scale: 2

      t.timestamps
    end
  end
end
