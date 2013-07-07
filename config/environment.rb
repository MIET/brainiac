# Load the rails application
require File.expand_path('../application', __FILE__)

Time::DATE_FORMATS[:default] = '%d/%m/%Y %H:%M:%S'

# Initialize the rails application
Brainiac::Application.initialize!
