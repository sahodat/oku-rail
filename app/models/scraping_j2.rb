class Scraping_j2 < ApplicationRecord
require 'net/http'
require 'uri'
require 'json'


  def self.get_opdt_joban

  url = URI.parse(URI.escape("https://api-tokyochallenge.odpt.org/api/v4/odpt:Train?acl:consumerKey=01415c9ddab724a44abd0895d9b41524a92765481aa5967e0d01449c7c6c6872&odpt:railway=odpt.Railway:JR-East.JobanLocal"))


  res = Net::HTTP.start(url.host, url.port, use_ssl: true){|http|
      http.get(url.path + "?" + url.query);
  }
  obj = JSON.parse(res.body)

    obj_str = obj.to_s
    obj_array = obj_str.split(",")

      n = 0
      while n < 30 do
      id = 0 +17*n
      o_type = 1 +17*n
      date = 2+ 17*n
      context = 3 + 17*n
      o_valid = 4 + 17*n
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
      id = obj_array[id].delete('[{\"@id\"=>\"urn:uuid:')  #列車IDの表示

       tmp = obj_array[o_type].sub(/ "@type"=>"odpt./,'')
      o_type = tmp.sub(/"/,'')


        tmp = obj_array[date].sub(/ \"dc:date\"/,'')
        tmp1 = tmp.sub(/=>/,'')
        tmp2 = tmp1.delete('\"')
        tmp3 = tmp2.sub(/09:00/,'')
        tmp4 = tmp3.delete('+')
      date = tmp4.sub(/T/,' ')



        tmp = obj_array[context].sub(/ \"@context\"=>/,'')
        tmp1 = tmp.sub(/\"/,'')
      context = tmp1.sub(/\"/,'')


        tmp = obj_array[o_valid].sub(/ \"dct:valid\"/,'')
        tmp1 = tmp.sub(/=>/,'')
        tmp2 = tmp1.delete('\"')
        tmp3 = tmp2.sub(/09:00/,'')
        tmp4 = tmp3.delete('+')
      o_valid = tmp4.sub(/T/,' ')


      delay = obj_array[delay].delete(' \"odpt:delay\"=>')   #遅れの表示

      opdt_index = obj_array[odptindex].delete(' \"odpt:index\"=>')

        tmp = obj_array[sameas].sub(/ \"owl:sameAs\"=>\"odpt./,'')
      sameas = tmp.sub(/\"/,'')

        tmp = obj_array[railway].sub(/ \"odpt:railway\"=>\"odpt.Railway:JR-East./,'')
     railway = tmp.sub(/\"/,'')

        tmp = obj_array[operator].sub(/ \"odpt:operator\"=>\"odpt.Operator:/,'')
      operator = tmp.sub(/\"/,'')

        tmp = obj_array[tostation].sub(/ \"odpt:toStation\"=>\"odpt.Station:JR-East.JobanLocal./,'')
      tostation = tmp.sub(/\"/,'')

        tmp = obj_array[traintype].sub(/ \"odpt:trainType\"=>\"odpt.TrainType:/,'')
      traintype = tmp.sub(/\"/,'')

        tmp = obj_array[fromstaiton].sub(/ \"odpt:fromStation\"=>\"odpt.Station:JR-East.JobanLocal./,'') #出発駅の表示
     fromstation = tmp.sub(/\"/,'')

      trainnumber = obj_array[trainnumber].delete(' \"odpt:trainNumber\"=>')

        tmp = obj_array[direction].sub(/ \"odpt:railDirection\"=>\"odpt.RailDirection:/,'')
      direction = tmp.sub(/\"/,'')

      composition = obj_array[composition].delete(' \"odpt:carComposition\"=>')

        tmp = obj_array[destination].delete('\"')
        tmp1 = tmp.delete('[]')
        tmp2 = tmp1.sub(/ odpt:destinationStation=>odpt.Station:/,'')
      tmp3 = tmp2.sub(/apid./,'')
      destination = tmp3.delete('}')
      n = n + 1
      opdtjoban = OpdtJoban.new(o_id: id, date: date, context: context, delay: delay,opdt_index: opdt_index,same_as: sameas,railway: railway, operator: operator, to_station: tostation, train_type: traintype, from_station: fromstation,train_number:trainnumber, direction: direction,composition: composition,destinantion_station: destination, o_valid: o_valid, o_type: o_type)
      opdtjoban.save
    end
  end
end


