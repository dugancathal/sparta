require 'spec_helper'

describe "teachers/index" do
  before(:each) do
    assign(:teachers, [
      stub_model(Teacher,
        :email => "Email"
      ),
      stub_model(Teacher,
        :email => "Email"
      )
    ])
  end

  it "renders a list of teachers" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
