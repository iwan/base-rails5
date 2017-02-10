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
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    notes "Lorem ipsum"
    locale "en"
    role "basic"
  end
end
