#!/usr/bin/env ruby
require "rest-client"
require "json"

class APIClient
  def initialize(base_url = "https://localhost:9292")
    @base_url = base_url
  end

  class CLIInterface
    def initialize
      @api_client = APIClient.new
    end

    def display_main_menu
      puts "\n👻 Welcome to the Scooby-Doo Mystery Tracker 👻"
      puts "==========================================="
      puts "MONSTER COMMANDS"
      puts "[1] ➤ Mystery Menu"
      puts "[2] ➤ Monster Menu"
      puts "[3] ➤ Exit"
      print "\nChoose an option: "
    end

    def display_mystery_menu
      puts "\n🕵️ Mystery Menu"
      puts "-----------------"
      puts "[1] View All Mysteries"
      puts "[2] Add a New Mystery"
      puts "[3] Update a Mystery"
      puts "[4] Delete a Mystery"
      puts "[5] Back to Main Menu"
      print "\nChoose an option: "
    end

    def display_monster_menu
      puts "\n👹 Monster Menu"
      puts "-----------------"
      puts "[1] View All Monsters"
      puts "[2] View Monsters by Disguise"
      puts "[3] Add a New Monster"
      puts "[4] Update a Monster"
      puts "[5] Delete a Monster"
      puts "[6] Back to Main Menu"
      print "\nChoose an option "
    end

    def run
      puts "Welcome to your CLI Application!"
      puts "This application connects to your Sinatra API."
      puts "Make sure your API server is running on http://localhost:9292"
      puts

      menu_loop
    end

    def menu_loop
      loop do
        display_main_menu
        pick = gets.chomp

        case pick
        when "1"
          mystery_menu
        when "2"
          monster_menu
        when "3"
          puts "👋 Goodbye!"
          break
        else
          puts "❗ Invalid option. Please try again."
        end
      end
    end

    def mystery_menu
      loop do
        display_mystery_menu
        pick = gets.chomp

        case pick
        when "1"
          puts "View All Mysteries"
        when "2"
          puts "Add a New Mystery"
        when "3"
          puts "Update a Mystery"
        when "4"
          puts "Delete a Mystery"
        when "5"
          puts "Back to Main Menu"
          break
        else
          puts "❗ Invalid option. Please try again."
        end
      end
    end

    def monster_menu
      loop do
        display_monster_menu
        pick = gets.chomp

        case pick
        when "1"
          puts "View All Monsters"
        when "2"
          puts "View Monsters by Disguise"
        when "3"
          puts "Add a New Monster"
        when "4"
          puts "Update a Monster"
        when "5"
          puts "Delete a Monster"
        when "6"
          puts "Back to Main Menu"
          break
        else
          puts "❗ Invalid option. Please try again."
        end
      end
    end
  end

  # TODO: Build your CLI application here!
  #
  # Requirements:
  # - Be object-oriented (at least two classes)
  # - Make HTTP requests to your Sinatra API
  # - Parse and display JSON responses
  # - Accept user input and use it to send requests
  # - Use a loop or menu interface
  # - Include current value prompts for updates

  # TODO: Implement your CLI functionality here
  puts "TODO: Build your CLI application"

  # Run the CLI application
  CLIInterface.new.run if __FILE__ == $0
end
