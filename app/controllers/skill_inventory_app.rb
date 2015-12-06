class SkillInventoryApp < Sinatra::Base
  get '/' do
    haml :dashboard
  end

  get '/skills' do
    @skills = SkillInventory.all
    haml :index
  end

  get '/bonus' do
    haml :bonus
  end

  get '/skills/new' do
    haml :new
  end

  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    haml :show
  end

  # not_found do
  #   erb :error
  # end

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    haml :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect "/skills"
  end

  # post '/save_image' do
  #   tempfile = params['file'][:tempfile]
  #   filename = params['file'][:filename]
  #   File.copy(tempfile.path, "./files/#{filename}")
  #   redirect '/'
  # end
end
