@opdt_yamanote = Opdt_yamanote.new

require 'net/http'
require 'uri'
require 'json'url = URI.parse(URI.escape("https://api-tokyochallenge.odpt.org/api/v4/odpt:Train?acl:consumerKey=01415c9ddab724a44abd0895d9b41524a92765481aa5967e0d01449c7c6c6872&odpt:railway=odpt.Railway:JR-East.Yamanote"))


res = Net::HTTP.start(url.host, url.port, use_ssl: true){|http|
    http.get(url.path + "?" + url.query);
}
obj = JSON.parse(res.body)  #jsonで取得

  n = 0
  while n < 30 do
      p "#{n+1}番目"
      p obj[n]
      n = n+1
  end
  obj_str = obj.to_s   #string型に変換
  obj_array = obj_str.split(",")   #カンマで分割
    n = 0
    while n < 30 do
    id = 0 +17*n
    type = 1 +17*n
    date = 2+ 17*n
    context = 3 + 17*n
    valid = 4 + 17*n
    delay = 5 +17*n
    odptindex = 6 + 17*n
    sameas = 7 + 17*n
    railway = 8 + 17*n
    operator = 9 + 17*n
    tostation = 10 + 17*n
    traintype = 11 + 17*n
    fromstaiton = 12 + 17*n
    trainnumber = 13 + 17*n
    direction = 14 + 17*n
    composition = 15 + 17*n
    destination = 16 + 17*n
     "---------------------------------------------------------------------------"
    @opdt_yamanote.@id = obj_array[id].delete('[{\"@id\"=>\"urn:uuid:')  #列車IDの表示
    @opdt_yamanote.save

    #   tmp = obj_array[type].sub(/ \"@type\"=>\"odpt./,'')
    # p tmp.sub(/\"/,'')

    #   tmp = obj_array[date].delete(' \"dc:date\"=>')  #時間の表示
    #   tmp1 = tmp.sub(/0900/,'')
    # p tmp1.delete('+')

    #   tmp = obj_array[context].sub(/ \"@context\"=>/,'')
    #   tmp1 = tmp.sub(/\"/,'')
    # p tmp2 = tmp1.sub(/\"/,'')

    #   tmp = obj_array[valid].delete(' \"dct:valid\"=>')  #時間の表示
    #   tmp1 = tmp.sub(/0900/,'')
    # p tmp1.delete('+')

    # p obj_array[delay].delete(' \"odpt:delay\"=>')   #遅れの表示

    # p obj_array[odptindex].delete(' \"odpt:index\"=>')

    #   tmp = obj_array[sameas].sub(/ \"owl:sameAs\"=>\"odpt./,'')
    # p tmp.sub(/\"/,'')

    #   tmp = obj_array[railway].sub(/ \"odpt:railway\"=>\"odpt.Railway:JR-East./,'')
    # p tmp.sub(/\"/,'')

    #   tmp = obj_array[operator].sub(/ \"odpt:operator\"=>\"odpt.Operator:/,'')
    # p tmp.sub(/\"/,'')

    #   tmp = obj_array[tostation].sub(/ \"odpt:toStation\"=>\"odpt.Station:JR-East.Yamanote./,'')
    # p tmp.sub(/\"/,'')

    #   tmp = obj_array[traintype].sub(/ \"odpt:trainType\"=>\"odpt.TrainType:/,'')
    # p tmp.sub(/\"/,'')

    #   tmp = obj_array[fromstaiton].sub(/ \"odpt:fromStation\"=>\"odpt.Station:JR-East.Yamanote./,'') #出発駅の表示
    # p tmp.sub(/\"/,'')

    # p obj_array[trainnumber].delete(' \"odpt:trainNumber\"=>')

    #   tmp = obj_array[direction].sub(/ \"odpt:railDirection\"=>\"odpt.RailDirection:/,'')  #進行方向の表示 ??innerloopしか取れてない？
    # p tmp.sub(/\"/,'')

    # p obj_array[composition].delete(' \"odpt:carComposition\"=>')

    #   tmp = obj_array[destination].sub(/ \"odpt:destinationStation:\"=>\"odpt.Station:JR-East.Yamanote.:/,'')
    #   tmp2 = tmp.sub(/\"/,'')   #[]のせいでうまくいかない
    # p tmp3 =  tmp2.delete('[')
    # n = n + 1
  end
