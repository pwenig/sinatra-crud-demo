require 'sinatra/base'
class Application < Sinatra::Application

  get '/' do
    @songs = DB[:songs].to_a
    erb :index

  end

  get '/new' do
    erb :new
  end

  post '/' do
    DB[:songs].insert(
    title: params[:song][:title],
    album: params[:song][:album],
    date_of_release: params[:song][:date_of_release],
    )
    redirect '/'
  end

  get '/songs/:id' do
  @songs = DB[:songs].where(id: params[:id]).first
    erb :show
  end

get '/songs/:id/edit' do
  @songs = DB[:songs].where(id: params[:id]).first
  erb :edit
end

  put '/songs/:id/edit' do
    @songs = DB[:songs].where(id: params[:id]).update(
      title: params[:song][:title],
      album: params[:song][:album],
      date_of_release: params[:song][:date_of_release],
    )
    redirect '/'
  end

  delete '/songs/:id' do
    @songs = DB[:songs].where(id: params[:id]).delete
    redirect '/'
  end

end

