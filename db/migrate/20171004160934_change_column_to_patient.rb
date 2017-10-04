class ChangeColumnToPatient < ActiveRecord::Migration[5.1]
  def up
    change_column :patients, :post_code, :string
  end

  def down
    change_column :patients, :post_code, :integer
  end
end
