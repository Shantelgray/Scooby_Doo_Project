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
    { error: "Like... No Mystery Dude" }.to_json
  end

  post "/mysteries" do
    mystery = Mystery.new(mystery_params)

    if mystery.save
      status 201
      mystery.to_json(include: :monsters)
    else
      status 422
      { error: mystery.errors.full_messages }.to_json
    end
  end

  patch "/mysteries/:id" do
    mystery = Mystery.find(params[:id])

    if mystery.update(mystery_params)
      mystery.to_json(include: :monsters)
    else
      status 422
      { error: mystery.errors.full_messages }.to_json
    end
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Like... No Mystery Dude" }.to_json
  end

  delete "/mysteries/:id" do
    mystery = Mystery.find(params[:id])
    mystery.destroy
    status 204
  rescue ActiveRecord::RecordNotFound
    status 404
    { error: "Like.. No Mystery Dude" }.to_json
  end

  private

  def mystery_params
    {
      title: params[:title],
      location: params[:location],
      date_reported: params[:date_reported],
    }
  end
end
