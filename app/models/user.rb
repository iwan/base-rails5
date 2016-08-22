class User < ApplicationRecord
  def full_name
    "#{first_name} #{last_name}"
  end
  alias fullname full_name
  alias name full_name
  alias_attribute :firstname, :first_name
  alias_attribute :lastname, :last_name

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_one :account, dependent: :destroy

  after_save do
    account.update_attribute(:email, email) if account
  end

end
