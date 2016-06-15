require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
require "sinatra/content_for"

# configure do
#   enable :sessions
#   set :session_secret, 'secret'
#   set :erb, :escape_html => true
# end

root = File.expand_path("..", __FILE__)

get "/" do
  @files = Dir.glob(root + "/data/*").map do |path|
    File.basename(path)
  end

  erb :index
end

get "/:filename" do
  file = params[:filename]
  headers["Content-Type"] = "text/plain"
  @text = File.read(root + "/data/#{file}")


  erb :text
end