require 'spec_helper'

describe Puttfs do
  it 'has a version number' do
    expect(Puttfs::VERSION).not_to be nil
  end

  describe ".puttfs" do
    it "prepends a pointy arrow to the put-ed object" do
      output = Tempfile.new("puttfs")
      Puttfs.configure { |config| config.output = output }
      Puttfs.puttfs("booop")
      output.rewind
      expect(output.read).to eq("#{Puttfs::POINTY_ARROW}booop\n")
      Puttfs.configure { |config| config.output = $stdout }
      output.close
      output.unlink
    end

    it "can take multiple arguments" do
      output = Tempfile.new("puttfs")
      Puttfs.configure { |config| config.output = output }
      Puttfs.puttfs("booop", "beeep")
      output.rewind
      expect(output.read).to eq("#{Puttfs::POINTY_ARROW}booop\nbeeep\n")
      Puttfs.configure { |config| config.output = $stdout }
      output.close
      output.unlink
    end
  end

  describe ".config" do
    describe "output" do
      specify "with the defaults it should be STDOUT" do
        expect(Puttfs.config.output).to eq($stdout)
      end
    end
  end

  describe ".configure" do
    it "yields the config to a block" do
      expect {
        Puttfs.configure { |config| config.output = :foo }
      }.to change { Puttfs.config.output }.to(:foo)

      Puttfs.configure { |config| config.output = $stdout }
    end
  end

  specify "`puttfs` can be used anywhere" do
    output = double("output")
    Puttfs.configure { |config| config.output = output }
    expect(output).to receive(:puts).with(Puttfs::POINTY_ARROW, "booop")
    puttfs("booop")
    Puttfs.configure { |config| config.output = $stdout }
  end

  specify "`puttfs` can be used anywhere with multiple arguments" do
    output = double("output")
    Puttfs.configure { |config| config.output = output }
    expect(output).to receive(:puts).with(Puttfs::POINTY_ARROW, "booop", "beeep")
    puttfs("booop", "beeep")
    Puttfs.configure { |config| config.output = $stdout }
  end
end
