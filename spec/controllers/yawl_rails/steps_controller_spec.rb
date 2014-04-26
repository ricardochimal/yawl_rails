require 'spec_helper'

module YawlRails
  describe StepsController do
    before(:each) do
      @process_name = "p1-123"
      @process_id = Yawl::Process.insert(:desired_state => "testing", :name => @process_name)
      @step_id = Yawl::Step.insert(:process_id => @process_id, :name => "step1", :seq => 1)
    end

    describe "GET #show" do
      it "renders the right template" do
        get :show, :process_id => @process_name, :id => @step_id, :use_route => :yawl_rails

        expect(response).to be_success
        expect(response).to render_template("show")
      end

      it "assigns @step" do
        get :show, :process_id => @process_name, :id => @step_id, :use_route => :yawl_rails

        assigns(:step).id.should eq(@step_id)
      end
    end
  end
end
