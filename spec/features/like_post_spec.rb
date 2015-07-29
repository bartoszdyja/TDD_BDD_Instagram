require 'rails_helper.rb'

feature 'Creating posts' do  
  scenario 'can create a job' do
  	user = FactoryGirl.create(:user)
    visit('users/sign_in')
    expect(page).to_not have_content('Logout')
    fill_in 'user_username', with: 'abc'
    fill_in 'user_password', with: 'password'
    click_button 'Submit'
    click_link 'add'
    fill_in 'post_title', with: 'test picture'
    description = 'test_description' 
    fill_in 'post_description', with: description
    attach_file('post_picture', "app/assets/images/sample.jpg")
    click_button 'Submit'
    expect(page).to have_content('Post has been created')
    expect(page).to have_content(user.email)
    expect(page).to have_content('Like')
    expect(page.find('#post-1')).to have_content('0 Like')
    click_link 'Like'
    expect(page.find('#post-1')).to have_content('1')
    click_link 'Like'
    expect(page.find('#post-1')).to have_content('1')

  end
end