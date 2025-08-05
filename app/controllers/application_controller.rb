class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/monsters" do
    monsters = Monster.all
    monsters.to_json
  end

  get "/monsters/:id" do
    monster = Monster.find(params[:id])
    monster.to_json(include: :mystery)
  end

  get "/monsters/by_disguise_as" do
    monsters = Monster.order(:disguise_as)
    monsters.to_json(include: :mystery)
  end

  get "/mysteries/date_reported" do
    mysteries = Mystery.order(date_reported: :desc)
    mysteries.to_json(include: :monsters)
  end

  post "/mysteries" do
    mystery = Mystery.create(
      title: params[:title],
      location: params[:location],
      date_reported: params[:date_reported],
      monster_id: params[:monster_id]
    )
    mystery.to_json
  end

  post "/monsters" do
    monster = Monster.create(
      name: params[:name],
      disguise_as: params[:disguise_as]
    )
    monster.to_json
  end

  patch "/monsters/:id" do
    monster = Monster.find(params[:id])
    monster.update(
      name: params[:name],
      disguise_as: params[:disguise_as]
    )
    monster.to_json
  end

  patch "/mysteries/:id" do
    mystery = Mystery.find(params[:id])
    mystery.update(
      title: params[:title],
      location: params[:location],
      date_reported: params[:date_reported],
      mystery_id: params[:mystery_id]
    )
    mystery.to_json
  end

  delete "/monsters/:id" do
    monster = Monster.find(params[:id])
    monster.destroy
    monster.to_json
  end

  delete "/mysteries/:id" do
    mystery = Mystery.find(params[:id])
    mystery.destroy
    mystery.to_json
  end
end
