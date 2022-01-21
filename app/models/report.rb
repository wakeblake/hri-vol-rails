class Report < ApplicationRecord
  has_one :client, through: :case
  has_one :attorney, through: :case
  belongs_to :case
end
