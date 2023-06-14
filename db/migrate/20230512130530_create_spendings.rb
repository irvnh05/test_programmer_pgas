class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.integer :employee_id
      t.date :date
      t.decimal :value

      t.timestamps
    end
  end
end
