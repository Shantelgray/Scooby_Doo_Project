require "rest-client"
require "json"

class APIClient
  def initialize
    @base_url = "http://localhost:9292"
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
    response.body.empty? ? {} : JSON.parse(response.body)
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
    response.body.empty? ? {} : JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to delete mystery: #{e.message}" }
  end
end
