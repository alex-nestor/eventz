class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user

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
