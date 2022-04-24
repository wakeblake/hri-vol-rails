class ReplaceReportForeignKeyCase < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reports, :case, through: :case, null: false, foreign_key: true
    add_reference :reports, :case, null: false, foreign_key: true, dependent: :delete
  end
end
