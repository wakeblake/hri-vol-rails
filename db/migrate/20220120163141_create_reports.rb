class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.decimal :hours_volunteered
      t.float :fiscal_year  #change to date!
      t.references :client, null: false, foreign_key: true
      t.references :attorney, null: false, foreign_key: true
      t.references :case, null: false, foreign_key: true

      t.timestamps
    end
  end
end
