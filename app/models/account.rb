class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable # :registerable,

  belongs_to :user

  def name
    (user && user.full_name) || email
  end
  alias_method :username, :name

  before_save do
    self.email = user.email
  end

end
