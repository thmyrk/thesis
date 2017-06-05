require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'creates a post' do
    user = FactoryGirl.create(:user)
    topic = FactoryGirl.create(:topic)
    post = nil
    title = "The album pain"
    body = "Everybody has a headache because Radiohead isn't releasing it's album"
    expect {
      post = Post.create!(title: title, body: body, user: user, topic: topic)
    }.to change{ Post.count }.by(1)
    expect(post.user).to eq(user)
    expect(post.topic).to eq(topic)
    expect(post.title).to eq(title)
    expect(post.body).to eq(body)
  end

  it 'validates user presence' do
    topic = FactoryGirl.create(:topic)
    post = nil
    title = "The album pain"
    body = "Everybody has a headache because Radiohead isn't releasing it's album"
    expect {
      post = Post.create!(title: title, body: body, topic: topic)
    }.to change{ Post.count }.by(0).and raise_error(ActiveRecord::RecordInvalid)
  end

  it 'validates topic presence' do
    user = FactoryGirl.create(:user)
    post = nil
    title = "The album pain"
    body = "Everybody has a headache because Radiohead isn't releasing it's album"
    expect {
      post = Post.create!(title: title, body: body, user: user)
    }.to change{ Post.count }.by(0).and raise_error(ActiveRecord::RecordInvalid)
  end

  it 'validates title presence' do
    user = FactoryGirl.create(:user)
    topic = FactoryGirl.create(:topic)
    post = nil
    body = "Everybody has a headache because Radiohead isn't releasing it's album"
    expect {
      post = Post.create!(body: body, user: user, topic: topic)
    }.to change{ Post.count }.by(0).and raise_error(ActiveRecord::RecordInvalid)
  end

  it 'validates body presence' do
    user = FactoryGirl.create(:user)
    topic = FactoryGirl.create(:topic)
    post = nil
    title = "The album pain"
    expect {
      post = Post.create!(user: user, topic: topic, title: title)
    }.to change{ Post.count }.by(0).and raise_error(ActiveRecord::RecordInvalid)
  end
end
