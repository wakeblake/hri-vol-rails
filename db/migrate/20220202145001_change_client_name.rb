class ChangeClientName < ActiveRecord::Migration[7.0]
  def change
    change_table :clients do |t|
      t.rename :name, :clientname
    end
  end
end
