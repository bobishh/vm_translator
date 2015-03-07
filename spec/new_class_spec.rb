require 'spec_helper'
require 'new_class'
describe "New Class" do
  it "exists" do
    expect(NewClass).to be_kind_of Class
  end
end
