require 'spec_helper'
require 'imessage/parser'

describe Imessage::Parser do
  context '.parse' do
    it 'parse help' do
      expect {
        options = Imessage::Parser.parse(["--help"])
      }.to raise_error(SystemExit)
    end
    
    it 'parse contacts' do
      options = Imessage::Parser.parse(["--contacts", "foo@example.com,bar@example.com"])
      expect(options.contacts).to eq(["foo@example.com", "bar@example.com"])
    end
    
    it 'parse attachment' do
      options = Imessage::Parser.parse(["--attachment", "README.md"])
      expect(options.attachment).to eq(File.expand_path("README.md"))
    end
    
    it 'parse text' do
      options = Imessage::Parser.parse(["--text", "hello"])
      expect(options.text).to eq("hello")
    end
  end
end