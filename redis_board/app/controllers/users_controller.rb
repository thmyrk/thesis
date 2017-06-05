# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class UsersController < ApplicationController
  caches_action :latest
  def latest
    user = User.find(params[:id])
    @posts = user.get_latest_posts
  end
end
