class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.decimal :hours_volunteered
      t.date :fiscal_year
      t.references :client, null: false, foreign_key: true
      t.references :attorney, through: :case, null: false, foreign_key: true
      t.references :case, through: :case, null: false, foreign_key: true

      t.timestamps
    end
  end
end
