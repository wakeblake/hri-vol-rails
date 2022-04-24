class RemoveClientReferencesCaseAndAttorney < ActiveRecord::Migration[7.0]
  def change
    remove_reference :clients, :case, foreign_key: true
    remove_reference :clients, :attorney, through: :case, foreign_key: true
  end
end
