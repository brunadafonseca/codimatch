require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http redirect" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

  # describe "GET #show"
  # it "returns http redirect" do
  #   get :
  #   expect(response).to have_http_status(:success)
  # end
  describe "login" do
   it "logs in the user" do
     visit root_path
     expect(page).to have_content("log")
   end
end
end
