class RemoveCaseReferencesReport < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cases, :report
  end
end
