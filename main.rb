require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'how are you?'
end

get '/path/to' do
  "this is [/path/to]"
end

# ここから
get '/hello/*' do |name|
  "hello #{name}. how are you?"
end

get '/erb_template_page' do
  erb :erb_template_page
end
