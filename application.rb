require 'sinatra/base'

class Application < Sinatra::Application

  get '/' do
    erb :index
  end

  get '/people' do
    people = DB[:people].to_a
    erb :"people/index", locals: { people: people }
  end

  get '/people/new' do
    erb :"people/new"
  end

  post '/people' do
    date_of_birth = params[:person][:date_of_birth]
    DB[:people].insert(
      first_name: params[:person][:first_name],
      last_name: params[:person][:last_name],
      date_of_birth: date_of_birth.empty? ? nil : date_of_birth,
    )
    redirect '/people'
  end

  get '/people/:id' do
    person = DB[:people].where(id: params[:id]).first
    erb :"people/show", locals: { person: person }
  end

  get '/people/:id/edit' do
    person = DB[:people].where(id: params[:id]).first
    erb :"people/edit", locals: { person: person }
  end

  put '/people/:id' do
    date_of_birth = params[:person][:date_of_birth]
    DB[:people].where(id: params[:id]).update(
      first_name: params[:person][:first_name],
      last_name: params[:person][:last_name],
      date_of_birth: date_of_birth.empty? ? nil : date_of_birth,
    )
    redirect "/people/#{params[:id]}"
  end

  delete '/people/:id' do
    DB[:people].where(id: params[:id]).delete
    redirect "/people"
  end

end