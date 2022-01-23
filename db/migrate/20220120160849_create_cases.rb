class CreateCases < ActiveRecord::Migration[7.0]
  def change
    create_table :cases do |t|
      t.integer :legal_server_case_id
      t.references :attorney, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
