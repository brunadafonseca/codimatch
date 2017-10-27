require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http redirect" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "shared/_navbar.html.erb" do
  before { sign_in user }

  context "without profile" do
    let!(:user) { create(:user) }
    it "renders email" do
      expect(response).to have_http_status(:success)
    end
  end
end
end
