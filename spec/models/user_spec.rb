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

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
