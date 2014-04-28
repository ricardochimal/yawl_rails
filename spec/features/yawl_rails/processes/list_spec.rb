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
    expect(find(".pagination")).to have_link("1", href: "?page=1")
    expect(find(".pagination")).to have_link("2", href: "?page=2")
    expect(find(".pagination")).to_not have_link("3", href: "?page=3")
    expect(find(".pagination")).to_not have_link("0", href: "?page=0")
  end

  scenario "doesn't blow up if given a bad page number" do
    @p1 = ::Yawl::Process.insert(:name => "p1", :desired_state => "test1")
    @p2 = ::Yawl::Process.insert(:name => "p2", :desired_state => "test1")
    @p3 = ::Yawl::Process.insert(:name => "p3", :desired_state => "test1")

    visit yawl_rails.yawl_processes_path + "?page=3"
    expect(page).to have_selector(".pagination")
    expect(find(".pagination")).to_not have_link("3", href: "?page=3")
  end
end
