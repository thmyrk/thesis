require 'rails_helper'

RSpec.describe Topic, type: :model do
  it 'creates a topic' do
    topic = nil
    category = FactoryGirl.create(:category)
    user = FactoryGirl.create(:user)
    expect {
      topic = Topic.create!(name: "LP9", category: category, user: user)
    }.to change{ Topic.count }.by(1)
    expect(topic.name).to eq("LP9")
    expect(topic.category).to eq(category)
  end

  it 'fails name validation' do
    user = FactoryGirl.create(:user)
    expect {
      topic = Topic.create!(category: FactoryGirl.create(:category), user: user)
    }.to change{ Topic.count }.by(0).and raise_error(ActiveRecord::RecordInvalid)
  end

  it 'fails category validation' do
    user = FactoryGirl.create(:user)
    expect {
      topic = Topic.create!(name: "LP9", user: user)
    }.to change{ Topic.count }.by(0).and raise_error(ActiveRecord::RecordInvalid)
  end

  it 'fails user validation' do
    category = FactoryGirl.create(:category)
    expect {
      topic = Topic.create!(name: "LP9", category: category)
    }.to change{ Topic.count }.by(0).and raise_error(ActiveRecord::RecordInvalid)
  end
end
