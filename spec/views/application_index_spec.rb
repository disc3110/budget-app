require 'rails_helper'

RSpec.describe 'Splash screen', type: :feature do
  describe 'index page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Bugdery')
      expect(page).to have_content('Sign in')
      expect(page).to have_content('LOG IN')
      expect(page).to have_content('SIGN UP')
      click_on 'LOG IN'
      assert_current_path("/users/sign_in")
    end
  end
end