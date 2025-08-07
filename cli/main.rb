#!/usr/bin/env ruby
require_relative "api_client"
require_relative "cli_interface"
require "rest-client"
require "json"

# Run the CLI application
CLIInterface.new.run if __FILE__ == $0
