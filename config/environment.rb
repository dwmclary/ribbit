# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ribbit::Application.initialize!
MATERIALS = YAML::load_file(File.expand_path('db/materials.yml'))