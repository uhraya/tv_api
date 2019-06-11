class Show < ApplicationRecord
  belongs_to :show_type
  has_many :episodes
end
