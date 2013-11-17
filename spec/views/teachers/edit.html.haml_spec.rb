require 'spec_helper'

describe "teachers/edit" do
  before(:each) do
    @teacher = assign(:teacher, stub_model(Teacher,
      :email => "MyString"
    ))
  end

  it "renders the edit teacher form" do
    render
    assert_select "form[action=?][method=?]", teacher_path(@teacher), "post" do
      assert_select "input#teacher_email[name=?]", "teacher[email]"
    end
  end
end
