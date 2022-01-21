class ChangeReports < ActiveRecord::Migration[7.0]
  def change
    change_column :reports, :fiscal_year, :date
  end
end
