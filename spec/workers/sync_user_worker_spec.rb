require 'spec_helper'

describe SyncUserWorker do
  let(:user) { FactoryGirl.create :user }

  describe "#perform" do
    before do
      User.stub(:find) { user }
    end

    it "Happy Path" do
      User.any_instance.stub(:sync_github_data)
      user.should_receive :sync_github_data
      subject.perform(user.id)
    end

    it "Sync error" do
      User.any_instance.stub(:sync_github_data).and_raise
      expect{subject.perform(user.id)}.to change { ErrorLog.count }.by(1)
    end
  end
end
