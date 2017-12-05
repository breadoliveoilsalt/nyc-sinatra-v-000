class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.find_or_create_by(name: params[:figure][:name])
    end
    @landmark.save
    redirect to "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])

    if !params[:figure][:name].empty?
      @landmark.figure = Figure.find_or_create_by(name: params[:figure][:name])
    end

    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

end
