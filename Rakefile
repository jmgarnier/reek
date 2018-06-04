require 'bundler/gem_tasks'
require 'rake/clean'

Dir['tasks/**/*.rake'].each { |t| load t }

defaults = ['test:spec',
            'test:features',
            :rubocop,
            'test:quality']

local_test_run_configuration = defaults
local_test_run_configuration << 'configuration:update_default_configuration'
local_test_run_configuration << 'configuration:validate_configuration'

task local_test_run: local_test_run_configuration
task ci: defaults.push(:ataru)
task default: :local_test_run
