class CreatePatients < ActiveRecord::Migration[5.1]
    def change
        create_table :patients do |t|
            t.string :name
            t.string :kana
            t.string :sex
            t.date :birthdate
            t.string :phone
            t.integer :post_code
            t.string :address
            t.string :reason
            t.string :experience
            t.date :firstday
            t.text :memo

            t.timestamps
        end
    end
end
