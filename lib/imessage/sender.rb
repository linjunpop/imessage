module Imessage
  class Sender
    def self.send(message:'', contacts: [])
      contacts.each do |contact|
        apple_script_file = File.join(File.dirname(File.expand_path(__FILE__)), 'scripts/send_imessage.applescript')
        `osascript #{apple_script_file} '#{contact}' '#{message}'`
      end
    end
  end
end
