require "spec_helper"

feature "Process Page" do
  background do
    @p1_id = ::Yawl::Process.insert(:name => "p1", :desired_state => "test1")
  end

  scenario "javascript uses correct process url" do
    visit yawl_rails.yawl_process_path('p1')
    expect(page.source).to include("/yawl_rails/processes/p1/steps")
  end
end
