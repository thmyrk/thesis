require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'creates a new category' do
    category = nil
    expect {
      category = Category.create!(name: "Radiohead")
    }.to change{ Category.count }.by(1)
    expect(category.name).to eq("Radiohead")
  end

  it 'tries to create a category without a name' do
    expect {
      category = Category.create!
    }.to raise_error(ActiveRecord::RecordInvalid).and change{ Category.count }.by(0)
  end
end
