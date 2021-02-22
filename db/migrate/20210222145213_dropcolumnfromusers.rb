class Dropcolumnfromusers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :first_name
  end
end
