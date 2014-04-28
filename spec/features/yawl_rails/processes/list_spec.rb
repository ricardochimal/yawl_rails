require "spec_helper"

feature "List Processes" do
  scenario "does not contain pagination" do
    @p1 = ::Yawl::Process.insert(:name => "p1", :desired_state => "test1")

    visit yawl_rails.yawl_processes_path
    expect(page).to_not have_selector(".pagination")
  end

  scenario "contains pagination" do
    @p1 = ::Yawl::Process.insert(:name => "p1", :desired_state => "test1")
    @p2 = ::Yawl::Process.insert(:name => "p2", :desired_state => "test1")
    @p3 = ::Yawl::Process.insert(:name => "p3", :desired_state => "test1")

    visit yawl_rails.yawl_processes_path
    expect(page).to have_selector(".pagination")
  end
end
