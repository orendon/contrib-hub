require 'spec_helper'

feature "user visits site" do
  it "displays landing page" do
    visit root_url
    page.should have_content("Open Source Lovers")
    page.should have_content("Making easier to find cool repos to hack on!")
  end
end
