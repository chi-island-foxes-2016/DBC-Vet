require 'rails_helper'

describe User do
  let(:user) {create(:user)}

  it "has a username" do
    expect(user.username).to be_a(String)
  end
end
