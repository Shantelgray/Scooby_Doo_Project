class MysteriesController < Sinatra::Base
  get "/mysteries" do
    mysteries = Mystery.all
    mysteries.to_json(include: :monsters)
  end

  get "/mysteries/date_reported" do
    mysteries = Mystery.order(date_reported: :desc)
    mysteries.to_json(include: :monsters)
  end

  get "/mysteries/:id" do
    mystery = Mystery.find(params[:id])
    mystery.to_json(include: :monsters)
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Mystery not found" }.to_json
  end

  post "/mysteries" do
    mystery = Mystery.create(
      title: params[:title],
      location: params[:location],
      date_reported: params[:date_reported],
      monster_id: params[:monster_id]
    )
    mystery.to_json
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Mystery not found" }.to_json
  end

  patch "/mysteries/:id" do
    mystery = Mystery.find(params[:id])
    mystery.update(
      title: params[:title],
      location: params[:location],
      date_reported: params[:date_reported],
      monster_id: params[:monster_id]
    )
    mystery.to_json
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Mystery not found" }.to_json
  end

  delete "/mysteries/:id" do
    mystery = Mystery.find(params[:id])
    mystery.destroy
    mystery.to_json
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Mystery not found" }.to_json
  end
end
