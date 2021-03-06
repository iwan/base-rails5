# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  locale     :string(2)        default("en")
#  role       :integer          default("basic")
#


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
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  has_one :account, dependent: :destroy

  after_save do |u|
    u = u.reload
    a = u.account
    if a && u.email!=a.email
      a.update_without_password(email: u.email)
    end
  end

end
