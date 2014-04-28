require 'spec_helper'

describe ErrorLog do
  let(:error_log) { create :error_log }

  it "has a valid factory" do
    expect(build(:error_log)).to be_valid
  end

  it { should validate_presence_of(:action) }
  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:backtrace) }

end
