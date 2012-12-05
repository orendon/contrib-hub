require 'spec_helper'

feature "Adding tags" do

 let(:user) { 
    FactoryGirl.create(:user,
      name: 'Jose',
      token: '3ffc6c4ee03a7fa5fa12b50af8bbdffc089957f6'
    ) 
  }

  before {
    visit root_url(host: 'localhost:3000')
    sign_in  
  }

  it "adds a tag to user repo", js: true, selenium: true do
    page.should have_content "My Repos, Help Wanted?"
    find("li.repo-entry:first .add-tag-link").click
    find("li.repo-entry:first li.tagit-new input").set "algorithms"
    find("li.repo-entry:first .tagging input[value=Save]").click
    find("li.repo-entry:first .current-tags").should have_content("algorithms")
    #save_and_open_page
  end

private

  def sign_in
    click_link 'Sign in with'
    fill_in 'Username or Email', with: 'jlstr'
    fill_in 'Password', with: ''
    click_button 'Sign in'
  end

end
