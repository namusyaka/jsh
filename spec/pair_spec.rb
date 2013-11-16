require 'spec_helper'

describe JSH::Pair do
  let(:pair){ JSH::Pair.new }

  describe "#[]" do
    before { pair.data[:foo] = :bar }
    subject { pair[:foo] }
    it { should eq(:bar) }
  end

  describe "#[]=" do
    before { pair[:bar] = :foo  }
    it { expect(pair[:bar]).to eq(:foo) }
  end

  describe "all" do
    let(:all){ 10.times{|n| pair["test_#{n}"] = n }}
    before { pair.data = all }
    subject { pair.data }
    it { should eq(all) }
  end
end
