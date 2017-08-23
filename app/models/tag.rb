 class Tag < ApplicationRecord
    has_many :entry_tags
    has_many :entries, through: :entry_tags

    validates :description, presence: true
  end
