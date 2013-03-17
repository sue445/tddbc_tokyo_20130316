require 'spec_helper'

describe Ltsv do
  let(:ltsv){ Ltsv.new }

  describe '#dump' do
    subject{ ltsv.dump }

    context "値が入っていない時" do
      it{ should == "\n" }
    end
  end

  describe '#set' do
    subject!{ ltsv.set(key, val) }

    context "何も入ってない時" do
      let(:key) {"foo"}
      let(:val) {"hoge"}

      it "値がセットされている" do
        ltsv.instance_variable_get(:@hash)[key].should == val
      end

      it{ should be_nil }
    end
  end
end
