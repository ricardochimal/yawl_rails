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

    describe "GET #show" do
      it "shows the process" do
        @p1 = ::Yawl::Process.insert(:desired_state => "test1", :name => "p1-test")

        get :show, id: "p1-test", use_route: :yawl_rails

        expect(response).to be_success
        expect(response).to render_template("show")
      end

      it "returns a 404 for an unknown process" do
        get :show, id: "unknown-test", use_route: :yawl_rails

        expect(response.code).to eq("404")
        expect(response).to_not render_template("show")
      end
    end
  end
end
