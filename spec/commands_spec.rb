require 'spec_helper'

describe JSH::Commands do
  let(:commands){ JSH::Commands.new }
  describe ".register" do
    it "before key" do
      JSH::Commands.register(:hey){ "hey" }
      expect(commands.commands[:hey].call).to eq("hey")
    end
  end
end
