require 'rails_helper'

describe User do
  let(:user) {create(:user)}
  let(:group) {create(:group)}
  let(:document) {create(:document)}

  it "has a username" do
    expect(user.username).to be_a(String)
  end

  it "has many users_groups" do
    user.groups << group
    expect(user.users_groups).to be_a(UsersGroup::ActiveRecord_Associations_CollectionProxy)
    expect(user.users_groups.length).to eq(1)
  end

  it "has many groups" do
    user.groups << group
    expect(user.groups).to be_a(Group::ActiveRecord_Associations_CollectionProxy)
    expect(user.groups.length).to eq(1)
  end

  it "has many users_documents" do
    user.completed_documents << document
    expect(user.users_documents).to be_a(UsersDocument::ActiveRecord_Associations_CollectionProxy)
    expect(user.users_documents.length).to eq(1)
  end

  it "has many completed_documents" do
    user.completed_documents << document
    expect(user.completed_documents).to be_a(Document::ActiveRecord_Associations_CollectionProxy)
    expect(user.completed_documents.length).to eq(1)
  end
end
