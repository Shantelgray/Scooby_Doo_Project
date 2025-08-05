# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
   get '/monsters' do
    monsters = Monster.all
    monsters.to_json
  end

  get '/monsters/:id' do
    monsters = Monster.find(params[:id])
    monster.to_json(include: :mystery)
  end

  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
end
