class User < ApplicationRecord
  enum role: [ :admin, :basic ]
  
  def full_name
    if first_name.blank? && last_name.blank?
      email
    else
      "#{first_name} #{last_name}"
    end    
  end
  alias fullname full_name
  alias name full_name
  alias_attribute :firstname, :first_name
  alias_attribute :lastname, :last_name

  validates :email, presence: true
  # validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_one :account, dependent: :destroy

  after_save do
    account.update_attribute(:email, email) if account
  end

end
