class Employee < ApplicationRecord
    belongs_to :departement
    belongs_to :spending
end
