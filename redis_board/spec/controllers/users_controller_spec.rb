# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #latest" do
    it "returns http success" do
      get :latest
      expect(response).to have_http_status(:success)
    end
  end

end
