class DelayJobanController < ApplicationController

  def delay_joban

    @job = OpdtJoban.group("HOUR(date)").group(:from_station).group(:direction).count
    @jobdelay = OpdtJoban.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 0 and delay < 301").count
    @jobhugedelay = OpdtJoban.group("HOUR(date)").group(:from_station).where("delay > 900").count

    gon.job = @job
    gon.jobdelay = @jobdelay
    gon.jobhugedelay = @jobhugedelay

    # ここから天気取得# ここから天気取得# ここから天気取得# ここから天気取得
    require 'net/http'
    require 'uri'
    require 'json'

    uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    tmpresult = result['forecasts'][0]
    showweather = tmpresult['telop']
    # p "今日の天気は" + showweather
    checkweather = showweather.include?("雨")
    if checkweather == true then
      gon.mag = 1.1
    else
      gon.mag = 1.0
    end

  end
end
