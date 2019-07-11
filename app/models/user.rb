class User < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
