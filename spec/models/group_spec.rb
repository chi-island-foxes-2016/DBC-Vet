require 'rails_helper'

describe Group do
  let(:group) {create(:group)}

  it "has a group_type" do
    expect(group.group_type).to be_a(String)
  end
end
