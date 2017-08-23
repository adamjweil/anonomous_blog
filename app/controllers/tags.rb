 get '/tags/:tag_name' do
   @tag = Tag.find_by(description: params[:tag_name])

   erb :'tags/show'
 end  
