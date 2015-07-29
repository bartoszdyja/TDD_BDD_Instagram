require 'rails_helper.rb'

feature 'Destroy posts' do  
  scenario 'owner can edit post' do
  	user = FactoryGirl.create(:user)
    visit('users/sign_in')
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
    within('div.card-reveal') do
      click_link 'Visit'
    end
    expect(page).to have_content('Edit')
    expect(page).to have_content('Destroy')
    click_link('Destroy')
    expect(page).to have_content('deleted')

  end



  scenario 'not logged in users cannot destroy posts' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit('/')
    within('div.card-reveal') do
      click_link 'Visit'
    end
    expect(page).to_not have_content('Edit')
    expect(page).to_not have_content('Destroy')
  end


end