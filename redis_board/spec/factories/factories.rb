FactoryGirl.define do
  factory :user do
    name "John"
  end
end

FactoryGirl.define do
  factory :category do
    name "Radiohead"
  end
end

FactoryGirl.define do
  factory :topic do
    name "LP9"
    category
    user
  end
end

FactoryGirl.define do
  factory :subscription do
    user
    category
  end
end

FactoryGirl.define do
  factory :post do
    user
    topic
    title "Release date?"
    body "The release of a long-awaited album is a big mystery as the band doesn't leak any information to the public"
  end
end
