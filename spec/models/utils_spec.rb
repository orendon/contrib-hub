require 'spec_helper'

describe Utils do
  include Utils

  it "shoud get all languages" do
    FactoryGirl.create(:repo, language: "Ruby")
    FactoryGirl.create(:repo, language: "")
    FactoryGirl.create(:repo, language: nil)

    get_all_languages.should == ["Ruby"]
  end

end