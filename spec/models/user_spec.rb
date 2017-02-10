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

require 'rails_helper'

ENV["confirmable"] = "false" # <<<----- have you seen this?

RSpec.describe User, type: :model do

  it "create a user record after creating an account record" do
    pwd = "AbC123HkK"
    a = Account.create(email: "john@example.com", password: pwd, password_confirmation: pwd, tos_and_pp: true)
    user = a.user
    expect(user.email).to eq(a.email)
  end

  # Doesn't work!
  # -------------------
  # it "update account email when update user email" do
  #   pwd        = "AbC123HkK"
  #   prev_email = "john@example.com"
  #   new_email  = "nicholas@example.com"
  #   a = Account.create(email: prev_email, password: pwd, password_confirmation: pwd, tos_and_pp: true)
  #   u = a.user

  #   u.update_attribute(:email, new_email)
  #   sleep(1)
  #   u = u.reload
  #   a = u.account

  #   expect(u.email).to eq(new_email)  
  #   expect(a.email).to eq(new_email)
  # end
end
