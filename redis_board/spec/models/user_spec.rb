require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a user with name' do
    user = nil
    expect {
      user = User.create!(name: "John")
    }.to change { User.count }.by(1)
    expect(user.name).to eq("John")
  end

  it 'tries to create a user without a name' do
    expect {
      user = User.create!
    }.to raise_error(ActiveRecord::RecordInvalid).and change { User.count }.by(0)
  end
end
