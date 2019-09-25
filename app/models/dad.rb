class Dad < ApplicationRecord
    has_many :jokes, dependent: :destroy
end
