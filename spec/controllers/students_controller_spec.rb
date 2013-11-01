require 'spec_helper'

describe StudentsController do
  
  let(:valid_attributes) { { "id_number" => "123456",
                             "grade_level" => 6,
                           }
  }

  let(:valid_session) {{}}

  describe "GET index" do
    it "assigns all students as @students" do
      student = Student.create! valid_attributes
      get :index, {}, valid_session
      assigns(:students).should eq([student])
    end
  end

  describe "GET show" do
    it "assigns the requested student as @student" do
      student = Student.create! valid_attributes
      get :show, { :id => student.to_param }, valid_session
      assigns(:student).should eq(student)
    end
  end

  describe "GET new" do
    it "assigns a new student as @student" do
      get :new, {}, valid_session
      assigns(:student).should be_a_new(Student)
    end
  end

  describe "GET edit" do
    it "assigns the requested student as @student"  do
      student = Student.create! valid_attributes
      get :edit, { :id => student.to_param }, valid_session
      assigns(:student).should eq(student)
    end
  end

  describe "POST create" do
    describe "with valid parameters"  do
      it "creates a new Student" do
        expect {
          post :create, { :student => valid_attributes }, valid_session
        }.to change(Student, :count).by(1)
      end

      it "assigns newly created student as @student" do
        post :create, { :student => valid_attributes }, valid_session
        assigns(:student).should be_a(Student)
        assigns(:student).should be_persisted
      end

      it "redirects to the created teacher" do
        post :create, { :student => valid_attributes }, valid_session
        response.should redirect_to(Student.last)
      end
    end

    describe "with invalid parameters" do
      it "assigns a newly created but unsaved student as @student" do
        Student.any_instance.stub(:save).and_return(false)
        post :create, { :student => { "id_number" => "invalid value" } }, valid_session
        assigns(:student).should be_a_new(Student)
      end

      it "re-renders the 'new' template" do
        Student.any_instance.stub(:save).and_return(false)
        post :create, { :student => { "id_number" => "invalid value" } }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested student" do
        student = Student.create! valid_attributes
        Student.any_instance.should_receive(:update).with( { "id_number" => "123457" } )
        put :update, { :id => student.to_param, :student => { "id_number" => "123457" } }, valid_session
      end

      it "assigns the requested student as @student" do
        student = Student.create! valid_attributes
        put :update, { :id => student.to_param, :student => valid_attributes }, valid_session
        assigns(:student).should eq(student)  
      end

      it "redirects to the student" do
        student = Student.create! valid_attributes
        put :update, { :id => student.to_param, :student => valid_attributes }
        response.should redirect_to(student)
      end
    end
    
    describe "with invalid params" do
      it "assigns the student as @student" do
        student = Student.create! valid_attributes
        Student.any_instance.stub(:save).and_return(false)
        put :update, { :id => student.to_param, :student => { "id_number" => "invalid value" } }, valid_session
        assigns(:student).should eq(student)
      end

      it "re-renders the 'edit' template" do
        
      student = Student.create! valid_attributes
      Student.any_instance.stub(:save).and_return(false)
      put :update, { :id => student.to_param, :student => { "id_number" => "invalid value" } }, valid_session
      response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested Student" do
      student = Student.create! valid_attributes
      expect { 
        delete :destroy, { :id => student.to_param }, valid_session
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the students list" do
      student = Student.create! valid_attributes
      delete :destroy, { :id => student.to_param }, valid_session
      response.should redirect_to(students_url)
    end
  end
end
