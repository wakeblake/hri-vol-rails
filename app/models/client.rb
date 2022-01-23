class Client < ApplicationRecord
    has_many :cases
    has_many :attorneys, through: :cases
end
