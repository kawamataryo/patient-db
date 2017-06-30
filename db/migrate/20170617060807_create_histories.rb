class CreateHistories < ActiveRecord::Migration[5.1]
    def change
        create_table :histories do |t|
            t.date :history_date
            t.string :patient_name
            t.integer :sales
            t.references :patient

            t.timestamps
        end
    end
end
