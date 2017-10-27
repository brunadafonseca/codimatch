require 'rails_helper'

feature "Pro- and Demoting" do
      let!(:user) { create(:user) }
  scenario "Promote a pleb" do

    visit new_user_registration_path

    expect(page).to have_content("Log In")
  end
end
