class Case < ApplicationRecord
  belongs_to :attorney
  belongs_to :client
  has_one :report, dependent: :destroy
end
