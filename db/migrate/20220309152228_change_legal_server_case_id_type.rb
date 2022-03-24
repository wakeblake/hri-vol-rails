class ChangeLegalServerCaseIdType < ActiveRecord::Migration[7.0]
  def change
    change_column :cases, :legal_server_case_id, :string
  end
end
