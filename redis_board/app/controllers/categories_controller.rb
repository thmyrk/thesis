# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class CategoriesController < ApplicationController
  caches_action :show
  def show
    @category = Category.find(params[:id])
    @topics = @category.try(:topics)
  end
end
