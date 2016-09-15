class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         
  devise :registerable if ENV["registerable"]=="true"
     

  belongs_to :user

  def name
    (user && user.full_name) || email
  end
  alias_method :username, :name

  before_save do |account|
    if account.user
      account.email = user.email
    else
      puts "-----"
      user = User.create(email: account.email)
      puts user.inspect
      puts user.errors.full_messages
      account.user = user
    end
    
  end

end
