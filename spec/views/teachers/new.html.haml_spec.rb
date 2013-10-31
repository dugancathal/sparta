require 'spec_helper'

describe "teachers/new" do
  before(:each) do
    assign(:teacher, stub_model(Teacher,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new teacher form" do
    render
    assert_select "form[action=?][method=?]", teachers_path, "post" do
      assert_select "input#teacher_email[name=?]", "teacher[email]"
    end
  end
end
