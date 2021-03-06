# frozen_string_literal: true

module Reek
  module Configuration
    #
    # Configuration validator module.
    #
    module ConfigurationValidator
      private

      # :reek:UtilityFunction
      def smell_type?(key)
        Reek::SmellDetectors.const_defined? key
      rescue NameError
        false
      end

      # :reek:UtilityFunction
      def key_to_smell_detector(key)
        Reek::SmellDetectors.const_get key
      end

      def error_message_for_file_given(pathname)
        "Configuration error: `#{pathname}` is supposed to be a directory but is a file"
      end

      def with_valid_directory(path)
        directory = Pathname.new path.to_s.chomp('/')
        abort(error_message_for_file_given(directory)) if directory.file?
        yield directory if block_given?
      end
    end
  end
end
