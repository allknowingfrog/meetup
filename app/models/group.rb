class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users

  has_many :organizer_users, -> { where(role: :organizer) }, class_name: 'GroupUser'
  has_many :organizers, through: :organizer_users, source: :user

  validates :name, presence: true
end
