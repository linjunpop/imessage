module Imessage
  class Sender
    def deliver(options = {text:nil, attachment:nil, contacts: []})
      if options[:text].nil? && options[:attachment].nil?
        raise "You must specific at least a text or attachment."
      end

      if options[:contacts].empty?
        raise "You must specific at least one contact"
      end

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
      script = <<-SCRIPT
      on run argv
              set toAddress to first item of argv
              set theFilePath to second item of argv
              set theFile to POSIX file theFilePath
              tell application "System Events"
                      if exists file theFilePath then
                              tell application "Messages"
                                      send theFile to buddy toAddress of (service 1 whose service type is iMessage)
                              end tell
                      else
                              error "File not exist."
                      end if
              end tell
      end run
      SCRIPT
      `osascript -e'#{script}' '#{contact}' '#{attachment}'`
    end

    def deliver_text(text, contact)
      script = <<-SCRIPT
      on run argv
              set toAddress to first item of argv
              set message to second item of argv
              tell application "Messages"
                      send message to buddy toAddress of (service 1 whose service type is iMessage)
              end tell
      end run
      SCRIPT
      `osascript -e '#{script}' '#{contact}' '#{text}'`
    end
  end
end
