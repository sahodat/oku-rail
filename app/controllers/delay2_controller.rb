class Delay2Controller < ApplicationController

  def delay2

    @yam = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).count
    @yamdelay = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 59 and delay < 301").count
    @yamhugedelay = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 901").count

    gon.yam = @yam
    gon.yamdelay = @yamdelay
    gon.yamhugedelay = @yamhugedelay


# ここから天気取得# ここから天気取得# ここから天気取得# ここから天気取得
    require 'net/http'
    require 'uri'
    require 'json'

    uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    tmpresult = result['forecasts'][0]
    showweather = tmpresult['telop']
    p "今日の天気は" + showweather
    checkweather = showweather.include?("晴")
    if checkweather == true then
      gon.mag = 1.1
    end

  end

end
