require 'spec_helper'

describe Utils do
  include Utils

  it "should get all languages" do
    FactoryGirl.create(:repo, language: "Ruby")
    FactoryGirl.create(:repo, language: "")
    FactoryGirl.create(:repo, language: nil)

    expect(get_all_languages).to eq(["Ruby"])
  end

end
