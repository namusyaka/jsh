require 'spec_helper'

describe JSH::REPL do
  describe ".start" do
    context "with readline option" do
      it "should set true to @readline." do
        repl = JSH::REPL.new(JSH::Base, :readline => true)
        expect(repl.instance_variable_get(:@readline)).to be_true
        expect(repl.readline?).to be_true
      end
    end

    context "without readline option" do
      it "should set true as default value to @readline." do
        repl = JSH::REPL.new(JSH::Base)
        expect(repl.instance_variable_get(:@readline)).to be_true
        expect(repl.readline?).to be_true
      end
    end

    context "with noprompt option" do
      it "should set true to @noprompt." do
        repl = JSH::REPL.new(JSH::Base, :noprompt => true)
        expect(repl.instance_variable_get(:@noprompt)).to be_true
        expect(repl.noprompt?).to be_true
      end
    end

    context "without noprompt option" do
      it "should set false as default value to @noprompt." do
        repl = JSH::REPL.new(JSH::Base)
        expect(repl.instance_variable_get(:@noprompt)).to be_false
        expect(repl.noprompt?).to be_false
      end
    end
  end

  describe "#call_hook" do
    let(:repl){ JSH::REPL.new(JSH::Base.new) }
    let(:test){ [] }
    before do
      JSH::Hooks.register(:before){ test << :before }
      JSH::Hooks.register(:after){ test << :after }
      Readline.stub(:readline).and_return(:quit)
      repl.start
    end
    it { expect(test).to eq([:before, :after]) }
  end
end
