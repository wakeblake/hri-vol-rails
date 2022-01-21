class Case < ApplicationRecord
  has_many :attorneys
  belongs_to :client
  has_one :report, dependent: :destroy
end
