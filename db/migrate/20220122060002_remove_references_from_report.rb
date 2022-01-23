class RemoveReferencesFromReport < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reports, :client
    remove_reference :reports, :attorney
  end
end
