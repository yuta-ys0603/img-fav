require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      FactoryGirl.create(:user, name: "Hoge"),
      FactoryGirl.create(:user, name: "Fuga")
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hoge".to_s, :count => 1
    assert_select "tr>td", :text => "Fuga".to_s, :count => 1
  end
end
