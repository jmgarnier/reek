SAMPLES_DIR = Pathname.new(__dir__).relative_path_from(Pathname.pwd)

# Configuration paths
CONFIGURATION_DIR = SAMPLES_DIR.join('configuration')
REGULAR_CONFIGURATION_DIR = CONFIGURATION_DIR.join('regular_configuration')
EMPTY_SUB_DIRECTORY_DIR = REGULAR_CONFIGURATION_DIR.join('empty_sub_directory')
REGULAR_CONFIGURATION_FILE = REGULAR_CONFIGURATION_DIR.join('regular.reek.yml')
HOME_DIR = CONFIGURATION_DIR.join('home')
HOME_CONFIGURATION_FILE = HOME_DIR.join('home.reek.yml')

# Source paths
SMELLY_SOURCE_DIR = SAMPLES_DIR.join('smelly_source')
CLEAN_FILE = SAMPLES_DIR.join('clean_source').join('clean.rb')
SMELLY_FILE = SMELLY_SOURCE_DIR.join('smelly.rb')
