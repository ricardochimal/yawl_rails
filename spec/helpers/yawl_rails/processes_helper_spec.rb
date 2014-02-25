require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProcessesHelper. For example:
#
# describe ProcessesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
module YawlRails
  describe ProcessesHelper do
    it "pretty prints the hash" do
      helper.pretty_print_hash({"test" => "1235678910", "test2" => "456xxxxxxxxxxxx", "hash" => { "x" => "y", "a" => "b"}}).should eq("{\"test\"=>\"1235678910\",\n \"test2\"=>\"456xxxxxxxxxxxx\",\n \"hash\"=>{\"x\"=>\"y\", \"a\"=>\"b\"}}\n")
    end
  end
end
