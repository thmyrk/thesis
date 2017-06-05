require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it 'creates a subscription' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    subscription = nil
    expect {
      subscription = Subscription.create!(user: user, category: category)
    }.to change{ Subscription.count }.by(1)
    expect(subscription.user).to eq(user)
    expect(subscription.category).to eq(category)
  end

  it 'validates user presence' do
    category = FactoryGirl.create(:category)
    expect {
      subscription = Subscription.create!(category: category)
    }.to change{ Subscription.count }.by(0).and raise_error(ActiveRecord::RecordInvalid)
  end

  it 'validates category presence' do
    user = FactoryGirl.create(:user)
    expect {
      subscription = Subscription.create!(user: user)
    }.to change{ Subscription.count }.by(0).and raise_error(ActiveRecord::RecordInvalid)
  end
end
