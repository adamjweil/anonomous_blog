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
  tags = params[:blog_tags].split(" ")

  tags.each do |tag_name|

    tag = Tag.find_by(name: tag_name)
    if tag
      @entry.tags << tag
    else
      @entry.tags << Tag.new(name: tag_name)
    end
  end
  if @entry.save
    redirect '/entries'
  else
    erb :'entries/new'
  end
end
