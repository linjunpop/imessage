require 'pathname'

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
      apple_script_file_path = build_apple_script_file_path('send_attachment')

      cmd = <<~CMD.strip
        osascript #{apple_script_file_path} "#{contact}" "#{attachment}"
      CMD

      system cmd
    end

    def deliver_text(text, contact)
      apple_script_file_path = build_apple_script_file_path('send_text')

      cmd = <<~CMD.strip
        osascript #{apple_script_file_path} "#{contact}" "#{text}"
      CMD

      system cmd
    end

    def build_apple_script_file_path(filename)
      filepath = File.dirname(Pathname.new(__FILE__).realpath)
      File.join(filepath, "apple_scripts/#{filename}.applescript")
    end
  end
end
