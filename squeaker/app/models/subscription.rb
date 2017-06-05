class Subscription
  include Cequel::Record

  belongs_to :follower, class_name: "User"
  key :id, :timeuuid, auto: true
  column :followed_name, :text, index: true

  validates :followed_name, presence: true
end
