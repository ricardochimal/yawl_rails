require 'spec_helper'

module YawlRails
  describe ProcessesController do
    describe "GET #index" do
      it "renders the right template" do
        get :index, use_route: :yawl_rails

        expect(response).to be_success
        expect(response).to render_template("index")
      end

      it "loads all yawl processes into @processes" do
        @p1 = ::Yawl::Process.insert(:desired_state => "test1")
        @p2 = ::Yawl::Process.insert(:desired_state => "test1")

        get :index, use_route: :yawl_rails

        assigns(:processes).map(&:id).should match_array([@p2, @p1])
      end
    end
  end
end
