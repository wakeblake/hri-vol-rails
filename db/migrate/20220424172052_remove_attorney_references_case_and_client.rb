class RemoveAttorneyReferencesCaseAndClient < ActiveRecord::Migration[7.0]
  def change
    remove_reference :attorneys, :case, foreign_key: true
    remove_reference :attorneys, :client, through: :case, foreign_key: true
  end
end
