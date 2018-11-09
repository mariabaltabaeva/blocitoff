require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create!(email: "example@example.com", password: "1234567") }
  let(:item) { Item.create!(name: "New Item Name", user: user) }

  it { is_expected.to belongs_to(:user) }

   describe "attributes" do
     it "has name, user attribute" do
       expect(item).to have_attributes(name: "New Item Name", user: user)
     end
   end
end
