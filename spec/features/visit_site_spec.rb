require 'spec_helper'

feature "user visits site" do
  it "displays landing page" do
    visit root_url
    page.should have_content("We Love Open Source")  
  end
end
