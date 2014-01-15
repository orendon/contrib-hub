require 'spec_helper'

describe MapUrlBuilder do
  let(:data) { [ {latitude: 67, longitude: 67}, {latitude: 40, longitude: 40} ] }
  let(:subject) { MapUrlBuilder.new('100x100') }
  let(:user) { build(:user) }
  let(:repos) { [ build(:repo), build(:repo) ] }

  describe "#add_marker" do
    it "builds one single marker correctly" do
      map_url = "http://maps.google.com/maps/api/staticmap?&size=100x100&maptype=roadmap&markers=color:red%7Clabel:O%7C67,67&sensor=false&zoom=13"
      expect( subject.add_marker('red', data.first).url ).to eq(map_url)
    end
  end

  describe "#add_markers" do
    it "builds multiple markers correctly" do
      map_url = "http://maps.google.com/maps/api/staticmap?&size=100x100&maptype=roadmap&markers=color:blue%7Clabel:O%7C67,67&markers=color:blue%7Clabel:O%7C40,40&sensor=false"
      expect( subject.add_markers('blue', data).url ).to eq(map_url)
    end
  end

  describe ".user_profile_map" do
    it "renders user profile map specific dimensions" do
      expect( MapUrlBuilder.user_profile_map(user) ).to match /size=350x350/
    end
  end

  describe ".search_results_map" do
    it "renders search results map specific dimensions" do
      expect( MapUrlBuilder.search_results_map(repos) ).to match /size=250x250/
    end
  end
end
