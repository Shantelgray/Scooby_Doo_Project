#!/usr/bin/env ruby
require_relative "lib/api_client"
require_relative "lib/cli_interface"
require "rest-client"
require "json"

# Run the CLI application
CLIInterface.new.run if __FILE__ == $0
