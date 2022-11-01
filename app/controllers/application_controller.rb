class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(only: [:name], include: {baked_goods: { only: [:name, :price]}})
  end

  get '/baked_goods/by_price' do
    bakeries = BakedGood.all.order(price: :desc)
    bakeries.to_json
  end
  
  get '/baked_goods/most_expensive' do
    bakeries = BakedGood.all.order(price: :desc).first
    bakeries.to_json(only: [:name, :price])
  end

end
