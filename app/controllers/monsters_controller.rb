class MonstersController < Sinatra::Base
  get "/monsters" do
    monsters = Monster.all
    monsters.to_json
  end

  get "/monsters/:id" do
    monster = Monster.find(params[:id])
    monster.to_json(include: :mystery)
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Like... No Monster Dude" }.to_json
  end

  get "/monsters/by_disguise_as" do
    monsters = Monster.order(:disguise_as)
    monsters.to_json(include: :mystery)
  end

  post "/monsters" do
    monster = Monster.create(
      name: params[:name],
      disguise_as: params[:disguise_as],
      mystery_id: params[:mystery_id]
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
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Like... No Monster Dude" }.to_json
  end

  delete "/monsters/:id" do
    monster = Monster.find(params[:id])
    monster.destroy
    monster.to_json
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Like... No Monster Dude" }.to_json
  end
end
