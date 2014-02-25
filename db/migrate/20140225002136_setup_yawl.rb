require "yawl/setup"

class SetupYawl < ActiveRecord::Migration
  def up
    Yawl::Setup.create!
  end

  def down
    Yawl::Setup.destroy!
  end
end
