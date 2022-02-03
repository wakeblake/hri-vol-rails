class Case < ApplicationRecord
  belongs_to :attorney
  belongs_to :client
  has_one :report, dependent: :destroy

  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :attorney
  accepts_nested_attributes_for :report
end
