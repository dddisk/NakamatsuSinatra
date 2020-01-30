# twitterライブラリの呼び出し
require 'twitter'
require 'dotenv'

Dotenv.load

# アクセストークンなどを設定
@client = Twitter::REST::Client.new do |config|

  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

# client tutorial
def tutorial
  puts "Welcome to Shimisunet Client."
  puts "このclientを起動時する際、末尾にオプションをつけてください"
  puts "-t HomeのTimeline取得"
  puts "-m リプライの取得"
  puts "-l リストの取得"
  puts "ツイートしたい内容 ツイートする！"
end

# display timeline
def homeTimeline
  @client.user_timeline("theokinawatimes").each do |tweet|
    puts tweet.text


  end
end

# display mentions
def mentionTimeline
  @client.mentions_timeline(:count => 1000).each do |tweet|
    if tweet.user.screen_name == "tkya03"
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
    end
  end
end

# display list
def listTimeline
  @client.list_timeline("listcreate_user", "list_name").each do |tweet|
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
  end
end

# # tweet
# def tweet
#   @client.update(ARGV[0])
#   puts "Tweetしたぞい"
# end

option = ARGV[0].to_s

if option == "" then
  tutorial
elsif option == "-t" then
  homeTimeline
elsif option == "-m" then
  mentionTimeline
elsif option == "-l" then
  listTimeline
else
  # tweet
  homeTimeline
end
