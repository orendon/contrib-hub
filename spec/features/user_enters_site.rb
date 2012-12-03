require 'spec_helper'

describe 'Landing page', type: :feature do
  it 'shows landing page content' do
    visit root_url
    page.should have_content('We Love Open Source')
  end
end
