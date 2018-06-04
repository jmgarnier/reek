require_relative '../lib/reek/detector_repository'
require_relative '../lib/reek/configuration/converter'

require 'yaml'

namespace :configuration do
  desc 'Updates the default configuration file when smell defaults change'
  task :update_default_configuration do
    puts "\nUpdating default configuration...\n"
    DEFAULT_SMELL_CONFIGURATION = 'defaults.reek'.freeze
    content = Reek::DetectorRepository.smell_types.each_with_object({}) do |klass, hash|
      hash[klass.smell_type] = Reek::Configuration::Converter.regexes_to_strings klass.default_config
    end
    File.open(DEFAULT_SMELL_CONFIGURATION, 'w') { |file| YAML.dump(content, file) }
  end

  desc 'Validates the default configuration against our schema'
  task :validate_configuration do
    puts "\nValidating default configuration...\n"
    # TODO
  end
end
