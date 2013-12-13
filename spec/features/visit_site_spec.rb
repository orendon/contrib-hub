require 'spec_helper'

feature "user visits site" do
  it "displays landing page" do
    visit root_url
    expect(page).to have_content("Open Source Lovers")
    expect(page).to have_content("Making it easier to find cool repos to hack on!")
  end
end
