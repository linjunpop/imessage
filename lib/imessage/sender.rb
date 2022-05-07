require 'shellwords'

module Imessage
  class Sender
    def deliver(options = { text: nil, attachment: nil, contacts: [] })
      raise 'You must specific at least a text or attachment.' if options[:text].nil? && options[:attachment].nil?

      raise 'You must specific at least one contact' if options[:contacts].empty?

      options[:contacts].each do |contact|
        _deliver(options[:text], options[:attachment], contact)
      end
    end

    private

    def _deliver(text, attachment, contact)
      if text && attachment
        deliver_text_and_attachment(text, attachment, contact)
      elsif text
        deliver_text(text, contact)
      elsif attachment
        deliver_attachment(attachment, contact)
      end
    end

    def deliver_text_and_attachment(text, attachment, contact)
      deliver_text(text, contact)
      deliver_attachment(attachment, contact)
    end

    def deliver_attachment(attachment, contact)
      apple_script_file = File.join(File.dirname(File.expand_path(__FILE__)), 'scripts/send_attachment.applescript')

      cmd = <<~CMD.strip
        osascript #{apple_script_file} "#{contact}" "#{attachment}"
      CMD

      system cmd
    end

    def deliver_text(text, contact)
      apple_script_file = File.join(File.dirname(File.expand_path(__FILE__)), 'apple_scripts/send_text.applescript')

      cmd = <<~CMD.strip
        osascript #{apple_script_file} "#{contact}" "#{text}"
      CMD

      puts cmd

      system cmd
    end
  end
end
