require 'spec_helper'
require 'imessage/sender'

describe Imessage::Sender do
  context '#deliver' do
    it 'deliver with text only' do
      sender = Imessage::Sender.new
      expect(sender).to receive(:deliver_text).with('hello', 'foo@example.com')
      sender.deliver(text: 'hello', contacts: ['foo@example.com'])
    end

    it 'deliver with attachment only' do
      sender = Imessage::Sender.new
      expect(sender).to receive(:deliver_attachment).with('README.md', 'foo@example.com')
      sender.deliver(attachment: 'README.md', contacts: ['foo@example.com'])
    end

    it 'deliver with text and attachment' do
      sender = Imessage::Sender.new
      expect(sender).to receive(:deliver_text_and_attachment).with('hello', 'README.md', 'foo@example.com')
      sender.deliver(text: 'hello', attachment: 'README.md', contacts: ['foo@example.com'])
    end

    it 'deliver nothing' do
      sender = Imessage::Sender.new
      expect {
        sender.deliver(text: nil, attachment: nil, contacts: ['foo@example.com'])
      }.to raise_error('You must specific at least a text or attachment.')
    end
  end
end