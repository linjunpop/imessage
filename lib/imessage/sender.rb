module Imessage
  class Sender
    def deliver(options = {text:nil, attachment:nil, contacts: []})
      options[:contacts].each do |contact|
        _deliver(options[:text], options[:attachment], contact)
      end
    end

    private

    def _deliver(text, attachment, contact)
      unless text.nil?
        apple_script_file = File.join(File.dirname(File.expand_path(__FILE__)), 'scripts/send_text.applescript')
        `osascript #{apple_script_file} '#{contact}' '#{text}'`
      end

      unless attachment.nil?
        apple_script_file = File.join(File.dirname(File.expand_path(__FILE__)), 'scripts/send_attachment.applescript')
        `osascript #{apple_script_file} '#{contact}' '#{attachment}'`
      end
    end
  end
end
