#!/usr/bin/env ruby
require "rest-client"
require "json"

class APIClient
  def initialize(base_url = "http://localhost:9292")
    @base_url = base_url
  end

  def get_monsters
    response = RestClient.get("#{@base_url}/monsters")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch monsters: #{e.message}" }
  end

  def get_monster(id)
    response = RestClient.get("#{@base_url}/monsters/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch monster: #{e.message}" }
  end

  def create_monster(data)
    response = RestClient.post("#{@base_url}/monsters", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to create monster: #{e.message}" }
  end

  def update_monster(id, data)
    response = RestClient.patch("#{@base_url}/monsters/#{id}", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to update monster: #{e.message}" }
  end

  def delete_monster(id)
    response = RestClient.delete("#{@base_url}/monsters/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to delete monster: #{e.message}" }
  end

  def get_monster_mysteries(monster_id)
    response = RestClient.get("#{@base_url}/monsters/#{monster_id}/mysteries")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch monster's mysteries: #{e.message}" }
  end

  def get_mysteries
    response = RestClient.get("#{@base_url}/mysteries")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch mysteries: #{e.message}" }
  end

  def get_mystery(id)
    response = RestClient.get("#{@base_url}/mysteries/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch mystery: #{e.message}" }
  end

  def create_mystery(data)
    response = RestClient.post("#{@base_url}/mysteries", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to create mystery: #{e.message}" }
  end

  def update_mystery(id, data)
    response = RestClient.patch("#{@base_url}/mysteries/#{id}", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to update mystery: #{e.message}" }
  end

  def delete_mystery(id)
    response = RestClient.delete("#{@base_url}/mysteries/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to delete mystery: #{e.message}" }
  end
end

class CLIInterface
  def initialize
    @api_client = APIClient.new
  end

  def display_main_menu
    puts "\n� Welcome to the Scooby-Doo Mystery Tracker 🦴"
    puts "==========================================="
    puts "🔍 MYSTERY COMMANDS 🔍"
    puts "[1] ➤ Mystery Menu 🗝️"
    puts "[2] ➤ Monster Menu 👻"
    puts "[3] ➤ Exit 🚐"
    print "\nChoose an option: "
  end

  def display_mystery_menu
    puts "\n�️ Mystery Menu 🔍"
    puts "-----------------"
    puts "[1] View All Mysteries 📜"
    puts "[2] Add a New Mystery 🆕"
    puts "[3] Update a Mystery 📝"
    puts "[4] Delete a Mystery 🗑️"
    puts "[5] Back to Main Menu 🔙"
    print "\nChoose an option: "
  end

  def display_monster_menu
    puts "\n� Monster Menu 👾"
    puts "-----------------"
    puts "[1] View All Monsters 🎭"
    puts "[2] View Monsters by Disguise 🎪"
    puts "[3] Add a New Monster 🆕"
    puts "[4] Update a Monster 📝"
    puts "[5] Delete a Monster 🗑️"
    puts "[6] Back to Main Menu 🔙"
    print "\nChoose an option "
  end

  def run
    puts "🐕 Scooby-Dooby-Doo! Welcome to the Mystery Machine! 🚐"
    puts "🦴 This application connects to your Sinatra API 🦴"
    puts "🔍 Make sure your API server is running on http://localhost:9292 🔍"
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
        puts "� Scooby-Dooby-Doo, Goodbye to you! 🦴"
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
        view_all_mysteries
      when "2"
        create_mystery
      when "3"
        update_mystery
      when "4"
        delete_mystery
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
        view_all_monsters
      when "2"
        view_mysteries_by_monster
      when "3"
        create_monster
      when "4"
        update_monster
      when "5"
        delete_monster
      when "6"
        puts "Back to Main Menu"
        break
      else
        puts "❗ Invalid option. Please try again."
      end
    end
  end

  private

  def view_all_monsters
    puts "\n👻 === All Monsters ===👻"
    response = @api_client.get_monsters

    if response.is_a?(Array)
      if response.empty?
        puts "No monsters found."
      else
        response.each do |monster|
          display_monster(monster)
          puts "👻👻👻#{'-' * 20}"
        end
      end
    else
      puts "Error: Unexpected response"
    end
  end

  def view_all_mysteries
    puts "\n🕵️  === All Mysteries === 🕵️"
    response = @api_client.get_mysteries

    if response.is_a?(Array)
      if response.empty?
        puts "No mysteries found."
      else
        response.each do |mystery|
          display_mystery(mystery)
          puts "🔍#{'-' * 18}"
        end
      end
    else
      puts "Error: Unexpected response"
    end
  end

  def create_monster
    puts "\n===👺👺👺 Create New Monster 👺👺👺==="

    print "Name: "
    name = gets.chomp

    print "Disguise as: "
    disguise_as = gets.chomp

    print "Mystery ID to assign this monster to: "
    mystery_id = gets.chomp.to_i

    data = { name: name, disguise_as: disguise_as, mystery_id: mystery_id }

    response = @api_client.create_monster(data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Monster created successfully!"
      display_monster(response)
    end
  end

  def create_mystery
    puts "\n===🔍🔍🔍 Create New Mystery 🔍🔍🔍==="

    monsters_response = @api_client.get_monsters
    if monsters_response.is_a?(Array) && !monsters_response.empty?
      puts "Available Monsters:"
      monsters_response.each { |monster| puts "#{monster['id']}. #{monster['name']}" }
    else
      puts "No monster available. Please create a monster first."
      return
    end

    print "Title: "
    title = gets.chomp

    print "Location: "
    location = gets.chomp

    print "Date Reported: "
    date_reported = gets.chomp

    data = { title: title, location: location, date_reported: date_reported }

    response = @api_client.create_mystery(data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Mystery created successfully!"
      display_mystery(response)
    end
  end

  def update_monster
    view_all_monsters
    puts "\nEnter the ID of the monster to update: "
    id = gets.chomp.to_i

    current_monster = @api_client.get_monster(id)
    if current_monster[:error]
      puts "Error: #{current_monster[:error]}"
      return
    end

    puts "\nCurrent monster data:"
    display_monster(current_monster)

    puts "\nEnter new values (press Enter to keep current value):"

    print "Name (#{current_monster['name']}): "
    name = gets.chomp
    name = current_monster["name"] if name.empty?

    print "Disguise As (#{current_monster['disguise_as']}): "
    disguise_as = gets.chomp
    disguise_as = current_monster["disguise_as"] if disguise_as.empty?

    print "Mystery ID (#{current_monster['mystery_id']}): "
    mystery_id_input = gets.chomp
    mystery_id = mystery_id_input.empty? ? current_monster["mystery_id"] : mystery_id_input.to_i

    data = {
      name: name,
      disguise_as: disguise_as,
      mystery_id: mystery_id,
    }

    response = @api_client.update_monster(id, data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Monster updated successfully!"
      display_monster(response)
    end
  end

  def display_monster(monster)
    puts "ID: #{monster['id']}"
    puts "Name: #{monster['name']}"
    puts "Disguise As: #{monster['disguise_as'] || 'None'}"
    puts "Mystery ID: #{monster['mystery_id']}"
  end

  def display_mystery(mystery)
    puts "ID: #{mystery['id']}"
    puts "Title: #{mystery['title']}"
    puts "Location: #{mystery['location'] || 'Unknown'}"
    puts "Date Reported: #{mystery['date_reported'] ? Date.parse(mystery['date_reported']).strftime('%B %d, %Y') : 'N/A'}"
  end

  def delete_monster
    view_all_monsters
    print "\nEnter the ID of the monster to delete: "
    id = gets.chomp.to_i

    response = @api_client.delete_monster(id)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Monster deleted successfully!"
    end
  end

  def delete_mystery
    view_all_mysteries
    print "\nEnter the ID of the mystery to delete: "
    id = gets.chomp.to_i

    response = @api_client.delete_mystery(id)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Mystery deleted successfully!"
    end
  end

  def update_mystery
    view_all_mysteries
    print "\nEnter the ID of the mystery to update: "
    id = gets.chomp.to_i

    current_mystery = @api_client.get_mystery(id)
    if current_mystery[:error]
      puts "Error: #{current_mystery[:error]}"
      return
    end

    puts "\nCurrent mystery data:"
    display_mystery(current_mystery)

    puts "\nEnter new values (press Enter to keep current value):"

    print "Title (#{current_mystery['title']}): "
    title = gets.chomp
    title = current_mystery["title"] if title.empty?

    print "Location (#{current_mystery['location']}): "
    location = gets.chomp
    location = current_mystery["location"] if location.empty?

    print "Date Reported (#{current_mystery['date_reported']}): "
    date_input = gets.chomp
    date_reported = date_input.empty? ? current_mystery["date_reported"] : date_input

    data = {
      title: title,
      location: location,
      date_reported: date_reported,
    }

    response = @api_client.update_mystery(id, data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Mystery updated successfully!"
      display_mystery(response)
    end
  end

  def view_mysteries_by_monster
    view_all_monsters
    print "\nEnter the monster ID to view its mystery: "
    monster_id = gets.chomp.to_i

    monster = @api_client.get_monster(monster_id)

    if monster[:error]
      puts "Error: #{monster[:error]}"
      return
    end

    mystery_id = monster["mystery_id"]
    mystery = @api_client.get_mystery(mystery_id)

    if mystery[:error]
      puts "Error: #{mystery[:error]}"
    else
      puts "\n=== Mystery for this monster ==="
      display_mystery(mystery)
    end
  end
end

# Run the CLI application
CLIInterface.new.run if __FILE__ == $0
