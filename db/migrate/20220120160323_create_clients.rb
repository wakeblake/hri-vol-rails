class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.references :case, foreign_key: true
      t.references :attorney, through: :case, foreign_key: true

      t.timestamps
    end
  end
end
