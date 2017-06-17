class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.date :historyDate
      t.string :patientName
      t.integer :sales
      t.references :patient

      t.timestamps
    end
  end
end
