class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  enum role: [:participant, :presenter, :organizer]
end
