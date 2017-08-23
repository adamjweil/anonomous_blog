get '/entries' do
    @entries = Entry.all

    erb :'entries/index'
  end

  get '/entries/new' do
    @entry = Entry.new

    erb :'entries/new'
  end

  post '/entries' do
    @entry = Entry.new(params[:entry])

    tag_names = params[:tag_names].split(" ")

    tag_names.each do |tag_name|
      tag = Tag.find_by(description: tag_name)

      if tag
        @entry.tags << tag
      else
        @entry.tags << Tag.new(description: tag_name)
      end
    end

    if @entry.save
      redirect '/entries'
    else
      erb :'entries/new'
    end

  end

  get '/entries/:id' do
    @entry = Entry.find(params[:id])
    # @entry.tags = Tag.new

    erb :'entries/show'
  end


  get '/entries/:id/edit' do
    @entry = Entry.find(params[:id])

    erb :'entries/edit'
  end

  put '/entries/:id' do
    @entry = Entry.find(params[:id])
    @entry.assign_attributes(params[:entry])

    @entry.tags = []

    tag_names = params[:tag_names].split(" ")

    tag_names.each do |tag_name|
      tag = Tag.find_by(description: tag_name)

      if tag
        @entry.tags << tag
      else
        @entry.tags << Tag.new(description: tag_name)
      end
    end

    if @entry.save
      redirect "/entries/#{@entry.id}"
    else
      erb :'entries/edit'
    end
  end

  delete '/entries/:id' do
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect '/entries'
  end 
