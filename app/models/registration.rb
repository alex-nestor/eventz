class Registration < ApplicationRecord
  belongs_to :event

  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+/ } #  non-whitespace character

  HOW_HEARD_OPTIONS = [
    'NewsLetter',
    'Blog Post',
    'Twitter',
    'Web Search',
    'Friend/Cowoker',
    'Other'
  ].freeze

  validates :how_heard,
            inclusion: { in: HOW_HEARD_OPTIONS }
end
