require 'spec_helper'

describe Ltsv do
  let(:ltsv){ Ltsv.new }

  describe '#dump' do
    subject{ ltsv.dump }

    context "値が入っていない時" do
      it{ should == "\n" }
    end

    context "1回目" do
      before do
        ltsv.set("foo", "hoge")
      end

      it{ should == "foo:hoge\n" }

      context "2回目" do
        before do
          ltsv.set("bar", "fuga")
        end

        it{ should == "foo:hoge\tbar:fuga\n" }

        context "3回目" do
          before do
            ltsv.set("foo", "piyo")
          end

          it{ should == "bar:fuga\tfoo:piyo\n" }
        end
      end
    end
  end

  describe '#set' do
    subject{ ltsv.set(key, val) }

    context "何も入ってない時" do
      let(:key) {"foo"}
      let(:val) {"hoge"}

      it "値がセットされている" do
        subject
        ltsv.instance_variable_get(:@hash)[key].should == val
      end

      it{ should be_nil }
    end

    context "値が入っている時" do
      let(:key)     {"foo"}
      let(:val)     {"fuga"}
      let(:old_val) {"hoge"}

      before do
        ltsv.set(key, old_val)
      end

      it "値がセットされている" do
        subject
        ltsv.instance_variable_get(:@hash)[key].should == val
      end

      it{ should == old_val }
    end

    context "異常系" do
      where(:key, :val) do
        [
            [nil, "momo"],
            ["", "gogo"],
            ["key", nil],
        ]
      end

      with_them do
        it { expect { subject }.to raise_error }
      end
    end
  end

  describe "#get" do
    subject{ ltsv.get(key) }

    let(:key) {"foo"}

    context "値が入ってない時" do
      it{ should be_nil }
    end

    context "値が入っている時" do
      let(:val) {"hoge"}

      before do
        ltsv.set(key, val)
      end

      it{ should == val }
    end
  end

  describe "#parse" do
    subject{ Ltsv.parse(dump_str) }

    let(:dump_str) { "foo:hoge\tbar:fuga\n" }

    its(["foo"]){ should == "hoge" }
    its(["bar"]){ should == "fuga" }
  end
end
