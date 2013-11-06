### GET ###

# frontpage
get '/' do
  erb :posts
end

# frontpage
get '/posts' do
  erb :posts
end

# specific post page
get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = Comment.where("post_id = ?", params[:id])
  erb :post
end

# user profile
get '/users/:id' do
  @user = User.find(params[:id])
  erb :user_profile
  # query for posts with submitter_id == params[:id], return count
  # query for comements with user_id == params[:id], return count
end

# user comments profile
get '/users/:id/comments' do
  # query for comments with user_id == params[:id], return all
end

# user comments profile
get '/users/:id/posts' do
  # query for posts with submitter_id == params[:id], return all
end

# user create page
get '/users/new' do
  # erb create_user
end

# user login page
get '/users/login' do
  # erb login_user
end

### POST ###

# create user
post '/users' do
  # query User.new( ... )
end

# login user
post '/users/login' do
  # query for user with login and password
  # store id into session
end

# create post
post '/posts' do
  # Post.create( ... )
  # erb post_new
end

# create comment
post '/post/:id' do
  # Comment.create( ... )
  # erb 'posts/:id'
end
