require 'rails_helper.rb'

feature 'Creating users' do
	scenario 'new user can be created' do 
		visit 'users/sign_up'
		fill_in 'user_username', with: 'test_user'
		fill_in 'user_email', with: 'test_user@email.com'
		fill_in 'user_password', with: 'password'
		fill_in 'user_password_confirmation', with: 'password'
		click_button 'Sign up'
		expect(page).to have_content('Welcome! You have signed up successfully.')
		expect(page).to have_content('Logout')
		expect(page).to have_content('add')
	end
end