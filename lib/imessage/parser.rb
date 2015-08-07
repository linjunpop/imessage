require 'optparse'
require 'ostruct'

module Imessage
  class Parser
    class << self
      def parse(options)
        OpenStruct.new.tap do |args|
          args.contacts = []
          args.text = nil
          args.attachment = nil
          args.verbose = false

          opt_parser(args).parse!(options)
        end
      end

      private

      def opt_parser(args)
        OptionParser.new do |opts|
          opts.banner = "Usage: imessage [options]"

          opts.separator ""
          opts.separator "Specific options:"

          opts.on("-t", "--text [TEXT]", String, "The TEXT to deliver") do |text|
            args.text = text
          end

          opts.on("-a", "--attachment [ATTACHMENT]", String, "Add an attachment") do |attachment|
            if File.exists?(attachment)
              args.attachment = File.expand_path(attachment)
            else
              puts "Can not find file #{attachment}"
              exit(1)
            end
          end

          opts.on("-c", "--contacts x,y,z", Array, "Deliver message to these CONTACTS") do |contacts|
            args.contacts = contacts
          end

          opts.separator ""
          opts.separator "Common options:"

          opts.on("-h", "--help", "Prints this help") do
            puts opts
            exit
          end

          opts.on_tail("--version", "Show version") do
            puts "imessage v#{Imessage::VERSION}"
            exit
          end
        end
      end
    end
  end
end
