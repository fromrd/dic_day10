class Blog < ApplicationRecord
  validates :user_id, presence: true
end
