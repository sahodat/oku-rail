class Delay2Controller < ApplicationController

def delay2

    @jcs = OpdtJoban.group("HOUR(date)").group(:from_station).count
    @jcssmalldelay = OpdtJoban.group("HOUR(date)").group(:from_station).where("delay > 0 and delay < 301").count
    @jcshugedelay = OpdtJoban.group("HOUR(date)").group(:from_station).where("delay > 900").count
    gon.job = @jcssmalldelay
    gon.job2 =  @jcs
    gon.job3 = @jcshugedelay


    @ys = OpdtYamanote.group("HOUR(date)").group(:from_station).count
    @yssmalldelay = OpdtYamanote.group("HOUR(date)").group(:from_station).where("delay > 0 and delay < 301").count
    @yshugedelay = OpdtYamanote.group("HOUR(date)").group(:from_station).where("delay > 900").count
    gon.yam = @yssmalldelay
    gon.yam2 =  @ys
    gon.yam3 = @yshugedelay


  # 天気の表示をさせたかった
   # API_KEY = "d8e73de4d8f45d9629f522dbc8159fd0"
   #     BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"

   # require "json"
   # require "open-uri"

   #  response = open(BASE_URL + "?q=Tokyo,jp&APPID=#{API_KEY}")

   #  @wether = JSON.pretty_generate(JSON.parse(response.read))
   #  gon.wether = @wether

end

end
