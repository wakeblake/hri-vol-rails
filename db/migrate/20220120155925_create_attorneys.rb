class CreateAttorneys < ActiveRecord::Migration[7.0]
  def change
    create_table :attorneys do |t|
      t.string :firm
      t.decimal :bill_rate_hr
      t.string :email
      t.string :name
      t.references :case, foreign_key: true
      t.references :client, through: :case, foreign_key: true

      t.timestamps
    end
  end
end
