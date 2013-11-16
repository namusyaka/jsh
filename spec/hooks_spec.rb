require 'spec_helper'

describe JSH::Hooks do
  let(:hooks){ JSH::Hooks.new }
  describe ".register" do
    context "for key that is pre-defined" do
      it "before key" do
        JSH::Hooks.register(:before){ "hello" }
        expect(hooks.hooks[:before].last.call).to eq("hello")
      end

      it "after key" do
        JSH::Hooks.register(:after){ "hello" }
        expect(hooks.hooks[:after].last.call).to eq("hello")
      end
    end
  end
end
