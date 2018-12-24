class Delay2Controller < ApplicationController

  def delay2

    @yam = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).count
    @yamdelay = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 59 and delay < 301").count
    @yamhugedelay = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 901").count

    gon.yam = @yam
    gon.yamdelay = @yamdelay
    gon.yamhugedelay = @yamhugedelay


  # # 天気の表示をさせたかった
  #  API_KEY = "d8e73de4d8f45d9629f522dbc8159fd0"
  #      BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"

  #  require "json"
  #  require "open-uri"

  #   response = open(BASE_URL + "?q=Tokyo,jp&APPID=#{API_KEY}")

  #   @wether = JSON.pretty_generate(JSON.parse(response.read))
  #   gon.wether = @wether

# # 天気うまくいないなああ
  # def weather
  #   require 'net/http'
  #   require 'uri'
  #   require 'json'

  #   uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
  #   json = Net::HTTP.get(uri)
  #   result = JSON.parse(json)


  #   gon.weather = "aa"

  #   print result['title'], "\n"
  #   print result['link'], "\n"
  #   print "予報の発表日時:#{result['publicTime']}", "\n"
  #   result['forecasts'].each do |forecast|
  #   print "--------------------"
  #   print "予報日:#{forecast['dateLabel']}", "\n"
  #   print "天気:#{forecast['telop']}", "\n"
  #   print "最低気温:#{forecast['temperature']['min']}", "\n"
  #   print "最高気温:#{forecast['temperature']['max']}", "\n"
  #   end
  # end


  end

end
