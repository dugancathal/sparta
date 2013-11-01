require 'spec_helper'

describe Student do
  it "has an id_number" do
   Student.new.should respond_to(:id_number)
  end

  it "has a grade_level" do
   Student.new.should respond_to(:grade_level)
  end
end
