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

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    notes "MyText"
  end
end
