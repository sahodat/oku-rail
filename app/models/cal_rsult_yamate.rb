class CalResultYamate < ApplicationRecord

def self.test
 aaa = CalResultYamate.where('station_group = ?', 1).where('this_hour = ?',16)
 aaa = CalResultYamate.find(60)
bbb = aaa.this_hour
p aaa
p bbb
end

def self.update_test
 $thour = 16
 sums1 = 200
 sum1 = 300
 sumh1 = 500
cal_result_yamates = CalResultYamate.where('station_group = ?', 1).where('this_hour = ?',$thour).update_all(:small_delay => sums1,:huge_delay => sumh1,:this_count=> sum1)

end

def self.delete_caltable
 ActiveRecord::Base.connection.execute("TRUNCATE TABLE cal_result_yamates;")
end

def self.delete_yamanote
 ActiveRecord::Base.connection.execute("TRUNCATE TABLE opdt_yamanotes;")
end



def self.update_cal_result_yamate
 # $thour = 10
 #     # faaaa = CalResultYamate.where("station_group = 11").where("this_hour = 16").select("this_count")
 get_cal = CalResultYamate.find_by_sql("SELECT this_count FROM cal_result_yamates WHERE this_hour = 16 AND station_group = 5")
 #     get_cal_str = get_cal.to_s
 #     get_cal = get_cal_str.delete('[#<CalResultYamate id: nil, this_count: >]')
 #     p get_cal_i = get_cal.to_i
 # p get_cal[0].this_count

 #     get_cal2 = CalResultYamate.find_by_sql("SELECT small_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 11")
 #     get_cal2_str = get_cal2.to_s
 #     get_cal2 = get_cal2_str.delete('[#<CalResultYamate id: nil, small_delay: >]')
 #     get_cal2_i = get_cal2.to_i
 #     p get_cal2_i


 #     get_cal3 = CalResultYamate.find_by_sql("SELECT huge_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 11")
 #     get_cal3_str = get_cal3.to_s
 #     get_cal3 = get_cal3_str.delete('[#<CalResultYamate id: nil, huge_delay: >]')
 #     get_cal3_i = get_cal3.to_i
 #     p get_cal3_i
   tmp = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).count
   smalldelay = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 59 and delay < 301").count
   hugedelay = OpdtYamanote.group("HOUR(date)").group(:from_station).where("delay > 500").group(:direction).count

    # p hugedelay


$thour = 0
    while $thour < 24

# 外回り新宿〜目白
    # tmp11 = tmp.fetch([$thour, "#{station_name}", "OuterLoop"])
    tmp11 = tmp.fetch([$thour, "Shinjuku", "OuterLoop"], 0)
    tmp12 = tmp.fetch([$thour, "ShinOkubo", "OuterLoop"], 0)
    tmp13 = tmp.fetch([$thour, "Takadanobaba", "OuterLoop"], 0)
    tmp14 = tmp.fetch([$thour, "Mejiro", "OuterLoop"], 0)
    sum1 = tmp11+tmp12+tmp13+tmp14
    # p sum1

    smalldelay11 = smalldelay.fetch([$thour, "Shinjuku", "OuterLoop"], 0)
    smalldelay12 = smalldelay.fetch([$thour, "ShinOkubo", "OuterLoop"], 0)
    smalldelay13 = smalldelay.fetch([$thour, "Takadanobaba", "OuterLoop"], 0)
    smalldelay14 = smalldelay.fetch([$thour, "Mejiro", "OuterLoop"], 0)


    sums1 = smalldelay11+smalldelay12+smalldelay13+smalldelay14
    # p sums1

    hugedelay11 = hugedelay.fetch([$thour, "Shinjuku", "OuterLoop"], 0)
    hugedelay12 = hugedelay.fetch([$thour, "ShinOkubo", "OuterLoop"], 0)
    hugedelay13 = hugedelay.fetch([$thour, "Takadanobaba", "OuterLoop"], 0)
    hugedelay14 = hugedelay.fetch([$thour, "Mejiro", "OuterLoop"], 0)

    # p hugedelay11
    # p hugedelay12
    # p hugedelay13
    # p hugedelay14

    sumh1 = hugedelay11+hugedelay12+hugedelay13+hugedelay14
    # p sumh1

    get_cal = CalResultYamate.find_by_sql("SELECT this_count FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 1")
     get_cal_str = get_cal.to_s
     get_cal = get_cal_str.delete('[#<CalResultYamate id: nil, this_count: >]')
     get_cal_i = get_cal.to_i

     get_cal2 = CalResultYamate.find_by_sql("SELECT small_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 1")

get_cal2_str = get_cal2.to_s
     get_cal2 = get_cal2_str.delete('[#<CalResultYamate id: nil, small_delay: >]')
     get_cal2_i = get_cal2.to_i

     get_cal3 = CalResultYamate.find_by_sql("SELECT huge_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 1")
     get_cal3_str = get_cal3.to_s
     get_cal3 = get_cal3_str.delete('[#<CalResultYamate id: nil, huge_delay: >]')
     get_cal3_i = get_cal3.to_i

     sum1 = sum1 + get_cal_i
     sums1 = sums1 + get_cal2_i
     sumh1 = sumh1 + get_cal3_i

     cal_result_yamates = CalResultYamate.where('station_group = ?', 1).where('this_hour = ?',$thour).update_all(:small_delay => sums1,:huge_delay => sumh1,:this_count=> sum1)


# おまけ（確率計算）
#      p "---------------------------"
#      p $thour ,"時"
#      smallp1 = (sums1*100)/(sum1+1)
#      hugep1 = (sumh1*100)/(sum1+1)
#      p smallp1 ,"%"
#      p hugep1 ,"%"



 # 外回り池袋〜鶯谷

    tmp21 = tmp.fetch([$thour, "Ikebukuro", "OuterLoop"], 0)
    tmp22 = tmp.fetch([$thour, "Otsuka", "OuterLoop"], 0)
    tmp23 = tmp.fetch([$thour, "Sugamo", "OuterLoop"], 0)
    tmp24 = tmp.fetch([$thour, "Komagome", "OuterLoop"], 0)
    tmp25 = tmp.fetch([$thour, "Tabata", "OuterLoop"], 0)
    tmp26 = tmp.fetch([$thour, "NishiNippori", "OuterLoop"], 0)
    tmp27 = tmp.fetch([$thour, "Nippori", "OuterLoop"], 0)
    tmp28 = tmp.fetch([$thour, "Uguisudani", "OuterLoop"], 0)

    sum2 = tmp21+tmp22+tmp23+tmp24+tmp25+tmp26+tmp27+tmp28
    # p sum2

    smalldelay21 = smalldelay.fetch([$thour, "Ikebukuro", "OuterLoop"], 0)
    smalldelay22 = smalldelay.fetch([$thour, "Otsuka", "OuterLoop"], 0)
    smalldelay23 = smalldelay.fetch([$thour, "Sugamo", "OuterLoop"], 0)
    smalldelay24 = smalldelay.fetch([$thour, "Komagome", "OuterLoop"], 0)
    smalldelay25 = smalldelay.fetch([$thour, "Tabata", "OuterLoop"], 0)
    smalldelay26 = smalldelay.fetch([$thour, "NishiNippori", "OuterLoop"], 0)
    smalldelay27 = smalldelay.fetch([$thour, "Nippori", "OuterLoop"], 0)
    smalldelay28 = smalldelay.fetch([$thour, "Uguisudani", "OuterLoop"], 0)

    sums2 = smalldelay21+smalldelay22+smalldelay23+smalldelay24+smalldelay25+smalldelay26+smalldelay27+smalldelay28
    # p sums2

    hugedelay21 = hugedelay.fetch([$thour, "Ikebukuro", "OuterLoop"], 0)
    hugedelay22 = hugedelay.fetch([$thour, "Otsuka", "OuterLoop"], 0)
    hugedelay23 = hugedelay.fetch([$thour, "Sugamo", "OuterLoop"], 0)
    hugedelay24 = hugedelay.fetch([$thour, "Komagome", "OuterLoop"], 0)
    hugedelay25 = hugedelay.fetch([$thour, "Tabata", "OuterLoop"], 0)
    hugedelay26 = hugedelay.fetch([$thour, "NishiNippori", "OuterLoop"], 0)
    hugedelay27 = hugedelay.fetch([$thour, "Nippori", "OuterLoop"], 0)
    hugedelay28 = hugedelay.fetch([$thour, "Uguisudani", "OuterLoop"], 0)

    sumh2 = hugedelay21+hugedelay22+hugedelay23+hugedelay24+hugedelay25+hugedelay26+hugedelay27+hugedelay28
    # p sumh2

    get_cal = CalResultYamate.find_by_sql("SELECT this_count FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 2")
     get_cal_str = get_cal.to_s
     get_cal = get_cal_str.delete('[#<CalResultYamate id: nil, this_count: >]')
     get_cal_i = get_cal.to_i

     get_cal2 = CalResultYamate.find_by_sql("SELECT small_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 2")
     get_cal2_str = get_cal2.to_s
     get_cal2 = get_cal2_str.delete('[#<CalResultYamate id: nil, small_delay: >]')
     get_cal2_i = get_cal2.to_i

     get_cal3 = CalResultYamate.find_by_sql("SELECT huge_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 2")
     get_cal3_str = get_cal3.to_s
     get_cal3 = get_cal3_str.delete('[#<CalResultYamate id: nil, huge_delay: >]')
     get_cal3_i = get_cal3.to_i

     sum2 = sum2 + get_cal_i
     sums2 = sums2 + get_cal2_i

sumh2 = sumh2 + get_cal3_i

     cal_result_yamates = CalResultYamate.where('station_group = ?', 2).where('this_hour = ?',$thour).update_all(:small_delay => sums1,:huge_delay => sumh1,:this_count=> sum1)



# 外回り上野〜神田
    tmp31 = tmp.fetch([$thour, "Ueno", "OuterLoop"], 0)
    tmp32 = tmp.fetch([$thour, "Okachimachi", "OuterLoop"], 0)
    tmp33 = tmp.fetch([$thour, "Akihabara", "OuterLoop"], 0)
    tmp34 = tmp.fetch([$thour, "Kanda", "OuterLoop"], 0)

    sum3 = tmp31+tmp32+tmp33+tmp34
    # p sum3

    smalldelay31 = smalldelay.fetch([$thour, "Ueno", "OuterLoop"], 0)
    smalldelay32 = smalldelay.fetch([$thour, "Okachimachi", "OuterLoop"], 0)
    smalldelay33 = smalldelay.fetch([$thour, "Akihabara", "OuterLoop"], 0)
    smalldelay34 = smalldelay.fetch([$thour, "Kanda", "OuterLoop"], 0)

    sums3 = smalldelay31+smalldelay32+smalldelay33+smalldelay34
    # p sums3

    hugedelay31 = hugedelay.fetch([$thour, "Ueno", "OuterLoop"], 0)
    hugedelay32 = hugedelay.fetch([$thour, "Okachimachi", "OuterLoop"], 0)
    hugedelay33 = hugedelay.fetch([$thour, "Akihabara", "OuterLoop"], 0)
    hugedelay34 = hugedelay.fetch([$thour, "Kanda", "OuterLoop"], 0)

    sumh3 = hugedelay31+hugedelay32+hugedelay33+hugedelay34
    # p sumh3
    get_cal = CalResultYamate.find_by_sql("SELECT this_count FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 3")
     get_cal_str = get_cal.to_s
     get_cal = get_cal_str.delete('[#<CalResultYamate id: nil, this_count: >]')
     get_cal_i = get_cal.to_i

     get_cal2 = CalResultYamate.find_by_sql("SELECT small_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 3")
     get_cal2_str = get_cal2.to_s
     get_cal2 = get_cal2_str.delete('[#<CalResultYamate id: nil, small_delay: >]')
     get_cal2_i = get_cal2.to_i

     get_cal3 = CalResultYamate.find_by_sql("SELECT huge_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 3")
     get_cal3_str = get_cal3.to_s
     get_cal3 = get_cal3_str.delete('[#<CalResultYamate id: nil, huge_delay: >]')
     get_cal3_i = get_cal3.to_i

     sum3 = sum3 + get_cal_i
     sums3 = sums3 + get_cal2_i
     sumh3 = sumh3 + get_cal3_i

     cal_result_yamates = CalResultYamate.where('station_group = ?', 3).where('this_hour = ?',$thour).update_all(:small_delay => sums1,:huge_delay => sumh1,:this_count=> sum1)

# 外回り東京〜田町
    tmp41 = tmp.fetch([$thour, "Tokyo", "OuterLoop"], 0)
    tmp42 = tmp.fetch([$thour, "Yurakucho", "OuterLoop"], 0)
    tmp43 = tmp.fetch([$thour, "Shimbashi", "OuterLoop"], 0)
    tmp44 = tmp.fetch([$thour, "Hamamatsucho", "OuterLoop"], 0)
    tmp45 = tmp.fetch([$thour, "Tamachi", "OuterLoop"], 0)

    sum4 = tmp41+tmp42+tmp43+tmp44+tmp45
    # p sum4

    smalldelay41 = smalldelay.fetch([$thour, "Tokyo", "OuterLoop"], 0)
    smalldelay42 = smalldelay.fetch([$thour, "Yurakucho", "OuterLoop"], 0)
    smalldelay43 = smalldelay.fetch([$thour, "Shimbashi", "OuterLoop"], 0)
    smalldelay44 = smalldelay.fetch([$thour, "Hamamatsucho", "OuterLoop"], 0)
    smalldelay45 = smalldelay.fetch([$thour, "Tamachi", "OuterLoop"], 0)

    sums4 = smalldelay41+smalldelay42+smalldelay43+smalldelay44+smalldelay45
    # p sums4

    hugedelay41 = hugedelay.fetch([$thour, "Tokyo", "OuterLoop"], 0)
    hugedelay42 = hugedelay.fetch([$thour, "Yurakucho", "OuterLoop"], 0)
    hugedelay43 = hugedelay.fetch([$thour, "Shimbashi", "OuterLoop"], 0)
    hugedelay44 = hugedelay.fetch([$thour, "Hamamatsucho", "OuterLoop"], 0)
    hugedelay45 = hugedelay.fetch([$thour, "Tamachi", "OuterLoop"], 0)

    sumh4 = hugedelay41+hugedelay42+hugedelay43+hugedelay44+hugedelay45
    # p sumh4

    get_cal = CalResultYamate.find_by_sql("SELECT this_count FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 4")

get_cal_str = get_cal.to_s
     get_cal = get_cal_str.delete('[#<CalResultYamate id: nil, this_count: >]')
     get_cal_i = get_cal.to_i

     get_cal2 = CalResultYamate.find_by_sql("SELECT small_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 4")
     get_cal2_str = get_cal2.to_s
     get_cal2 = get_cal2_str.delete('[#<CalResultYamate id: nil, small_delay: >]')
     get_cal2_i = get_cal2.to_i

     get_cal3 = CalResultYamate.find_by_sql("SELECT huge_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 4")
     get_cal3_str = get_cal3.to_s
     get_cal3 = get_cal3_str.delete('[#<CalResultYamate id: nil, huge_delay: >]')
     get_cal3_i = get_cal3.to_i

     sum4 = sum4 + get_cal_i
     sums4 = sums4 + get_cal2_i
     sumh4 = sumh4 + get_cal3_i

     cal_result_yamates = CalResultYamate.where('station_group = ?', 4).where('this_hour = ?',$thour).update_all(:small_delay => sums1,:huge_delay => sumh1,:this_count=> sum1)
# 外回り品川〜恵比寿
    tmp51 = tmp.fetch([$thour, "Shinagawa", "OuterLoop"], 0)
    tmp52 = tmp.fetch([$thour, "Osaki", "OuterLoop"], 0)
    tmp53 = tmp.fetch([$thour, "Gotanda", "OuterLoop"], 0)
    tmp54 = tmp.fetch([$thour, "Meguro", "OuterLoop"], 0)
    tmp55 = tmp.fetch([$thour, "Ebisu", "OuterLoop"], 0)

    sum5 = tmp51+tmp52+tmp53+tmp54+tmp55
    # p sum5

    smalldelay51 = smalldelay.fetch([$thour, "Shinagawa", "OuterLoop"], 0)
    smalldelay52 = smalldelay.fetch([$thour, "Osaki", "OuterLoop"], 0)
    smalldelay53 = smalldelay.fetch([$thour, "Gotanda", "OuterLoop"], 0)
    smalldelay54 = smalldelay.fetch([$thour, "Meguro", "OuterLoop"], 0)
    smalldelay55 = smalldelay.fetch([$thour, "Ebisu", "OuterLoop"], 0)

    sums5 = smalldelay51+smalldelay52+smalldelay53+smalldelay54+smalldelay55
    # p sums5

    hugedelay51 = hugedelay.fetch([$thour, "Shinagawa", "OuterLoop"], 0)
    hugedelay52 = hugedelay.fetch([$thour, "Osaki", "OuterLoop"], 0)
    hugedelay53 = hugedelay.fetch([$thour, "Gotanda", "OuterLoop"], 0)
    hugedelay54 = hugedelay.fetch([$thour, "Meguro", "OuterLoop"], 0)
    hugedelay55 = hugedelay.fetch([$thour, "Ebisu", "OuterLoop"], 0)

    sumh5 = hugedelay51+hugedelay52+hugedelay53+hugedelay54+hugedelay55
    # p sumh5

    get_cal = CalResultYamate.find_by_sql("SELECT this_count FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 5")
     get_cal_str = get_cal.to_s
     get_cal = get_cal_str.delete('[#<CalResultYamate id: nil, this_count: >]')
     get_cal_i = get_cal.to_i

     get_cal2 = CalResultYamate.find_by_sql("SELECT small_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 5")
     get_cal2_str = get_cal2.to_s
     get_cal2 = get_cal2_str.delete('[#<CalResultYamate id: nil, small_delay: >]')
     get_cal2_i = get_cal2.to_i

     get_cal3 = CalResultYamate.find_by_sql("SELECT huge_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 5")
     get_cal3_str = get_cal3.to_s
     get_cal3 = get_cal3_str.delete('[#<CalResultYamate id: nil, huge_delay: >]')
     get_cal3_i = get_cal3.to_i

     sum5 = sum5 + get_cal_i
     sums5 = sums5 + get_cal2_i
     sumh5 = sumh5 + get_cal3_i

     cal_result_yamates = CalResultYamate.where('station_group = ?', 5).where('this_hour = ?',$thour).update_all(:small_delay => sums1,:huge_delay => sumh1,:this_count=> sum1)

# 外回り渋谷〜代々木
    tmp61 = tmp.fetch([$thour, "Shibuya", "OuterLoop"], 0)
    tmp62 = tmp.fetch([$thour, "Harajuku", "OuterLoop"], 0)
    tmp63 = tmp.fetch([$thour, "Yoyogi", "OuterLoop"], 0)

    sum6 = tmp61
    # p sum6

    smalldelay61 = smalldelay.fetch([$thour, "Shibuya", "OuterLoop"], 0)
    smalldelay62 = smalldelay.fetch([$thour, "Harajuku", "OuterLoop"], 0)

smalldelay63 = smalldelay.fetch([$thour, "Yoyogi", "OuterLoop"], 0)

    sums6 = smalldelay61
    # p sums6

    hugedelay61 = hugedelay.fetch([$thour, "Shibuya", "OuterLoop"], 0)
    hugedelay62 = hugedelay.fetch([$thour, "Harajuku", "OuterLoop"], 0)
    hugedelay63 = hugedelay.fetch([$thour, "Yoyogi", "OuterLoop"], 0)

    sumh6 = hugedelay61
    # p sumh6

    get_cal = CalResultYamate.find_by_sql("SELECT this_count FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 6")
     get_cal_str = get_cal.to_s
     get_cal = get_cal_str.delete('[#<CalResultYamate id: nil, this_count: >]')
     get_cal_i = get_cal.to_i

     get_cal2 = CalResultYamate.find_by_sql("SELECT small_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 6")
     get_cal2_str = get_cal2.to_s
     get_cal2 = get_cal2_str.delete('[#<CalResultYamate id: nil, small_delay: >]')
     get_cal2_i = get_cal2.to_i

     get_cal3 = CalResultYamate.find_by_sql("SELECT huge_delay FROM cal_result_yamates WHERE this_hour = '#{$thour}' AND station_group = 6")
     get_cal3_str = get_cal3.to_s
     get_cal3 = get_cal3_str.delete('[#<CalResultYamate id: nil, huge_delay: >]')
     get_cal3_i = get_cal3.to_i

     sum6 = sum6 + get_cal_i
     sums6 = sums6 + get_cal2_i
     sumh6 = sumh6 + get_cal3_i

     cal_result_yamates = CalResultYamate.where('station_group = ?', 6).where('this_hour = ?',$thour).update_all(:small_delay => sums1,:huge_delay => sumh1,:this_count=> sum1)

    $thour = $thour + 1
  end
end

 def self.OuterLoop
   tmp = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).count
   smalldelay = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 59 and delay < 301").count
   hugedelay = OpdtYamanote.group("HOUR(date)").group(:from_station).where("delay > 500").group(:direction).count

    # p tmp
    # p smalldelay
    p hugedelay
   # tmp_str = tmp.to_s
   # tmp_array = tmp_str.split("[")
   # # tmp3_array = tmp_array.split(",")
   # n= 0
   # while n < 20
   #   p tmp_array[n]
   #   n = n + 1
   # end
   # tmp10 = tmp.keys
   # p tmp10


$thour = 0
    while $thour < 24

# 外回り新宿〜目白
    # tmp11 = tmp.fetch([$thour, "#{station_name}", "OuterLoop"])
    tmp11 = tmp.fetch([$thour, "Shinjuku", "OuterLoop"], 0)
    tmp12 = tmp.fetch([$thour, "ShinOkubo", "OuterLoop"], 0)
    tmp13 = tmp.fetch([$thour, "Takadanobaba", "OuterLoop"], 0)
    tmp14 = tmp.fetch([$thour, "Mejiro", "OuterLoop"], 0)
    sum1 = tmp11+tmp12+tmp13+tmp14
    # p sum1

    smalldelay11 = smalldelay.fetch([$thour, "Shinjuku", "OuterLoop"], 0)
    smalldelay12 = smalldelay.fetch([$thour, "ShinOkubo", "OuterLoop"], 0)
    smalldelay13 = smalldelay.fetch([$thour, "Takadanobaba", "OuterLoop"], 0)
    smalldelay14 = smalldelay.fetch([$thour, "Mejiro", "OuterLoop"], 0)


    sums1 = smalldelay11+smalldelay12+smalldelay13+smalldelay14
    # p sums1

    hugedelay11 = hugedelay.fetch([$thour, "Shinjuku", "OuterLoop"], 0)
    hugedelay12 = hugedelay.fetch([$thour, "ShinOkubo", "OuterLoop"], 0)
    hugedelay13 = hugedelay.fetch([$thour, "Takadanobaba", "OuterLoop"], 0)
    hugedelay14 = hugedelay.fetch([$thour, "Mejiro", "OuterLoop"], 0)

    # p hugedelay11
    # p hugedelay12
    # p hugedelay13
    # p hugedelay14

    sumh1 = hugedelay11+hugedelay12+hugedelay13+hugedelay14
    # p sumh1

    get_cal_result_yamate = CalResultYamate.new(station_group: 1, this_hour: $thour, small_delay: sums1, huge_delay: sumh1, this_count: sum1)
    get_cal_result_yamate.save

# おまけ（確率計算）
#      p "---------------------------"
#      p $thour ,"時"
#      smallp1 = (sums1*100)/(sum1+1)
#      hugep1 = (sumh1*100)/(sum1+1)
#      p smallp1 ,"%"
#      p hugep1 ,"%"



 # 外回り池袋〜鶯谷

tmp21 = tmp.fetch([$thour, "Ikebukuro", "OuterLoop"], 0)
    tmp22 = tmp.fetch([$thour, "Otsuka", "OuterLoop"], 0)
    tmp23 = tmp.fetch([$thour, "Sugamo", "OuterLoop"], 0)
    tmp24 = tmp.fetch([$thour, "Komagome", "OuterLoop"], 0)
    tmp25 = tmp.fetch([$thour, "Tabata", "OuterLoop"], 0)
    tmp26 = tmp.fetch([$thour, "NishiNippori", "OuterLoop"], 0)
    tmp27 = tmp.fetch([$thour, "Nippori", "OuterLoop"], 0)
    tmp28 = tmp.fetch([$thour, "Uguisudani", "OuterLoop"], 0)

    sum2 = tmp21+tmp22+tmp23+tmp24+tmp25+tmp26+tmp27+tmp28
    # p sum2

    smalldelay21 = smalldelay.fetch([$thour, "Ikebukuro", "OuterLoop"], 0)
    smalldelay22 = smalldelay.fetch([$thour, "Otsuka", "OuterLoop"], 0)
    smalldelay23 = smalldelay.fetch([$thour, "Sugamo", "OuterLoop"], 0)
    smalldelay24 = smalldelay.fetch([$thour, "Komagome", "OuterLoop"], 0)
    smalldelay25 = smalldelay.fetch([$thour, "Tabata", "OuterLoop"], 0)
    smalldelay26 = smalldelay.fetch([$thour, "NishiNippori", "OuterLoop"], 0)
    smalldelay27 = smalldelay.fetch([$thour, "Nippori", "OuterLoop"], 0)
    smalldelay28 = smalldelay.fetch([$thour, "Uguisudani", "OuterLoop"], 0)

    sums2 = smalldelay21+smalldelay22+smalldelay23+smalldelay24+smalldelay25+smalldelay26+smalldelay27+smalldelay28
    # p sums2

    hugedelay21 = hugedelay.fetch([$thour, "Ikebukuro", "OuterLoop"], 0)
    hugedelay22 = hugedelay.fetch([$thour, "Otsuka", "OuterLoop"], 0)
    hugedelay23 = hugedelay.fetch([$thour, "Sugamo", "OuterLoop"], 0)
    hugedelay24 = hugedelay.fetch([$thour, "Komagome", "OuterLoop"], 0)
    hugedelay25 = hugedelay.fetch([$thour, "Tabata", "OuterLoop"], 0)
    hugedelay26 = hugedelay.fetch([$thour, "NishiNippori", "OuterLoop"], 0)
    hugedelay27 = hugedelay.fetch([$thour, "Nippori", "OuterLoop"], 0)
    hugedelay28 = hugedelay.fetch([$thour, "Uguisudani", "OuterLoop"], 0)

    sumh2 = hugedelay21+hugedelay22+hugedelay23+hugedelay24+hugedelay25+hugedelay26+hugedelay27+hugedelay28
    # p sumh2

    get_cal_result_yamate = CalResultYamate.new(station_group: 2, this_hour: $thour, small_delay: sums2, huge_delay: sumh2, this_count: sum2)
    get_cal_result_yamate.save



# 外回り上野〜神田
    tmp31 = tmp.fetch([$thour, "Ueno", "OuterLoop"], 0)
    tmp32 = tmp.fetch([$thour, "Okachimachi", "OuterLoop"], 0)
    tmp33 = tmp.fetch([$thour, "Akihabara", "OuterLoop"], 0)
    tmp34 = tmp.fetch([$thour, "Kanda", "OuterLoop"], 0)

    sum3 = tmp31+tmp32+tmp33+tmp34
    # p sum3

    smalldelay31 = smalldelay.fetch([$thour, "Ueno", "OuterLoop"], 0)
    smalldelay32 = smalldelay.fetch([$thour, "Okachimachi", "OuterLoop"], 0)
    smalldelay33 = smalldelay.fetch([$thour, "Akihabara", "OuterLoop"], 0)
    smalldelay34 = smalldelay.fetch([$thour, "Kanda", "OuterLoop"], 0)

    sums3 = smalldelay31+smalldelay32+smalldelay33+smalldelay34
    # p sums3

    hugedelay31 = hugedelay.fetch([$thour, "Ueno", "OuterLoop"], 0)
    hugedelay32 = hugedelay.fetch([$thour, "Okachimachi", "OuterLoop"], 0)
    hugedelay33 = hugedelay.fetch([$thour, "Akihabara", "OuterLoop"], 0)
    hugedelay34 = hugedelay.fetch([$thour, "Kanda", "OuterLoop"], 0)

    sumh3 = hugedelay31+hugedelay32+hugedelay33+hugedelay34
    # p sumh3

    get_cal_result_yamate = CalResultYamate.new(station_group: 3, this_hour: $thour, small_delay: sums3, huge_delay: sumh3, this_count: sum3)
    get_cal_result_yamate.save

# 外回り東京〜田町
    tmp41 = tmp.fetch([$thour, "Tokyo", "OuterLoop"], 0)
    tmp42 = tmp.fetch([$thour, "Yurakucho", "OuterLoop"], 0)
    tmp43 = tmp.fetch([$thour, "Shimbashi", "OuterLoop"], 0)
    tmp44 = tmp.fetch([$thour, "Hamamatsucho", "OuterLoop"], 0)
    tmp45 = tmp.fetch([$thour, "Tamachi", "OuterLoop"], 0)

    sum4 = tmp41+tmp42+tmp43+tmp44+tmp45
    # p sum4

    smalldelay41 = smalldelay.fetch([$thour, "Tokyo", "OuterLoop"], 0)

smalldelay42 = smalldelay.fetch([$thour, "Yurakucho", "OuterLoop"], 0)
    smalldelay43 = smalldelay.fetch([$thour, "Shimbashi", "OuterLoop"], 0)
    smalldelay44 = smalldelay.fetch([$thour, "Hamamatsucho", "OuterLoop"], 0)
    smalldelay45 = smalldelay.fetch([$thour, "Tamachi", "OuterLoop"], 0)

    sums4 = smalldelay41+smalldelay42+smalldelay43+smalldelay44+smalldelay45
    # p sums4

    hugedelay41 = hugedelay.fetch([$thour, "Tokyo", "OuterLoop"], 0)
    hugedelay42 = hugedelay.fetch([$thour, "Yurakucho", "OuterLoop"], 0)
    hugedelay43 = hugedelay.fetch([$thour, "Shimbashi", "OuterLoop"], 0)
    hugedelay44 = hugedelay.fetch([$thour, "Hamamatsucho", "OuterLoop"], 0)
    hugedelay45 = hugedelay.fetch([$thour, "Tamachi", "OuterLoop"], 0)

    sumh4 = hugedelay41+hugedelay42+hugedelay43+hugedelay44+hugedelay45
    # p sumh4

    get_cal_result_yamate = CalResultYamate.new(station_group: 4, this_hour: $thour, small_delay: sums4, huge_delay: sumh4, this_count: sum4)
    get_cal_result_yamate.save

# 外回り品川〜恵比寿
    tmp51 = tmp.fetch([$thour, "Shinagawa", "OuterLoop"], 0)
    tmp52 = tmp.fetch([$thour, "Osaki", "OuterLoop"], 0)
    tmp53 = tmp.fetch([$thour, "Gotanda", "OuterLoop"], 0)
    tmp54 = tmp.fetch([$thour, "Meguro", "OuterLoop"], 0)
    tmp55 = tmp.fetch([$thour, "Ebisu", "OuterLoop"], 0)

    sum5 = tmp51+tmp52+tmp53+tmp54+tmp55
    # p sum5

    smalldelay51 = smalldelay.fetch([$thour, "Shinagawa", "OuterLoop"], 0)
    smalldelay52 = smalldelay.fetch([$thour, "Osaki", "OuterLoop"], 0)
    smalldelay53 = smalldelay.fetch([$thour, "Gotanda", "OuterLoop"], 0)
    smalldelay54 = smalldelay.fetch([$thour, "Meguro", "OuterLoop"], 0)
    smalldelay55 = smalldelay.fetch([$thour, "Ebisu", "OuterLoop"], 0)

    sums5 = smalldelay51+smalldelay52+smalldelay53+smalldelay54+smalldelay55
    # p sums5

    hugedelay51 = hugedelay.fetch([$thour, "Shinagawa", "OuterLoop"], 0)
    hugedelay52 = hugedelay.fetch([$thour, "Osaki", "OuterLoop"], 0)
    hugedelay53 = hugedelay.fetch([$thour, "Gotanda", "OuterLoop"], 0)
    hugedelay54 = hugedelay.fetch([$thour, "Meguro", "OuterLoop"], 0)
    hugedelay55 = hugedelay.fetch([$thour, "Ebisu", "OuterLoop"], 0)

    sumh5 = hugedelay51+hugedelay52+hugedelay53+hugedelay54+hugedelay55
    # p sumh5

    get_cal_result_yamate = CalResultYamate.new(station_group: 5, this_hour: $thour, small_delay: sums5, huge_delay: sumh5, this_count: sum5)
    get_cal_result_yamate.save

# 外回り渋谷〜代々木
    tmp61 = tmp.fetch([$thour, "Shibuya", "OuterLoop"], 0)
    tmp62 = tmp.fetch([$thour, "Harajuku", "OuterLoop"], 0)
    tmp63 = tmp.fetch([$thour, "Yoyogi", "OuterLoop"], 0)

    sum6 = tmp61
    # p sum6

    smalldelay61 = smalldelay.fetch([$thour, "Shibuya", "OuterLoop"], 0)
    smalldelay62 = smalldelay.fetch([$thour, "Harajuku", "OuterLoop"], 0)
    smalldelay63 = smalldelay.fetch([$thour, "Yoyogi", "OuterLoop"], 0)

    sums6 = smalldelay61
    # p sums6

    hugedelay61 = hugedelay.fetch([$thour, "Shibuya", "OuterLoop"], 0)
    hugedelay62 = hugedelay.fetch([$thour, "Harajuku", "OuterLoop"], 0)
    hugedelay63 = hugedelay.fetch([$thour, "Yoyogi", "OuterLoop"], 0)

    sumh6 = hugedelay61
    # p sumh6

    get_cal_result_yamate = CalResultYamate.new(station_group: 6, this_hour: $thour, small_delay: sums6, huge_delay: sumh6, this_count: sum6)
    get_cal_result_yamate.save

    $thour = $thour + 1
  end

 end


 def self.InnerLoop
   tmp = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).count
   smalldelay = OpdtYamanote.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 59 and delay < 301").count
   hugedelay = OpdtYamanote.group("HOUR(date)").group(:from_station).where("delay > 500").group(:direction).count

$thour = 0
    while $thour < 24

# 外回り新宿〜目白

# tmp11 = tmp.fetch([$thour, "#{station_name}", "InnerLoop"])
    tmp11 = tmp.fetch([$thour, "Shinjuku", "InnerLoop"], 0)
    tmp12 = tmp.fetch([$thour, "ShinOkubo", "InnerLoop"], 0)
    tmp13 = tmp.fetch([$thour, "Takadanobaba", "InnerLoop"], 0)
    tmp14 = tmp.fetch([$thour, "Mejiro", "InnerLoop"], 0)
    sum1 = tmp11+tmp12+tmp13+tmp14
    # p sum1

    smalldelay11 = smalldelay.fetch([$thour, "Shinjuku", "InnerLoop"], 0)
    smalldelay12 = smalldelay.fetch([$thour, "ShinOkubo", "InnerLoop"], 0)
    smalldelay13 = smalldelay.fetch([$thour, "Takadanobaba", "InnerLoop"], 0)
    smalldelay14 = smalldelay.fetch([$thour, "Mejiro", "InnerLoop"], 0)


    sums1 = smalldelay11+smalldelay12+smalldelay13+smalldelay14
    # p sums1

    hugedelay11 = hugedelay.fetch([$thour, "Shinjuku", "InnerLoop"], 0)
    hugedelay12 = hugedelay.fetch([$thour, "ShinOkubo", "InnerLoop"], 0)
    hugedelay13 = hugedelay.fetch([$thour, "Takadanobaba", "InnerLoop"], 0)
    hugedelay14 = hugedelay.fetch([$thour, "Mejiro", "InnerLoop"], 0)

    # p hugedelay11
    # p hugedelay12
    # p hugedelay13
    # p hugedelay14

    sumh1 = hugedelay11+hugedelay12+hugedelay13+hugedelay14
    # p sumh1

    get_cal_result_yamate = CalResultYamate.new(station_group: 11, this_hour: $thour, small_delay: sums1, huge_delay: sumh1, this_count: sum1)
    get_cal_result_yamate.save

# おまけ（確率計算）
#      p "---------------------------"
#      p $thour ,"時"
#      smallp1 = (sums1*100)/(sum1+1)
#      hugep1 = (sumh1*100)/(sum1+1)
#      p smallp1 ,"%"
#      p hugep1 ,"%"



 # 外回り池袋〜鶯谷

    tmp21 = tmp.fetch([$thour, "Ikebukuro", "InnerLoop"], 0)
    tmp22 = tmp.fetch([$thour, "Otsuka", "InnerLoop"], 0)
    tmp23 = tmp.fetch([$thour, "Sugamo", "InnerLoop"], 0)
    tmp24 = tmp.fetch([$thour, "Komagome", "InnerLoop"], 0)
    tmp25 = tmp.fetch([$thour, "Tabata", "InnerLoop"], 0)
    tmp26 = tmp.fetch([$thour, "NishiNippori", "InnerLoop"], 0)
    tmp27 = tmp.fetch([$thour, "Nippori", "InnerLoop"], 0)
    tmp28 = tmp.fetch([$thour, "Uguisudani", "InnerLoop"], 0)

    sum2 = tmp21+tmp22+tmp23+tmp24+tmp25+tmp26+tmp27+tmp28
    # p sum2

    smalldelay21 = smalldelay.fetch([$thour, "Ikebukuro", "InnerLoop"], 0)
    smalldelay22 = smalldelay.fetch([$thour, "Otsuka", "InnerLoop"], 0)
    smalldelay23 = smalldelay.fetch([$thour, "Sugamo", "InnerLoop"], 0)
    smalldelay24 = smalldelay.fetch([$thour, "Komagome", "InnerLoop"], 0)
    smalldelay25 = smalldelay.fetch([$thour, "Tabata", "InnerLoop"], 0)
    smalldelay26 = smalldelay.fetch([$thour, "NishiNippori", "InnerLoop"], 0)
    smalldelay27 = smalldelay.fetch([$thour, "Nippori", "InnerLoop"], 0)
    smalldelay28 = smalldelay.fetch([$thour, "Uguisudani", "InnerLoop"], 0)

    sums2 = smalldelay21+smalldelay22+smalldelay23+smalldelay24+smalldelay25+smalldelay26+smalldelay27+smalldelay28
    # p sums2

    hugedelay21 = hugedelay.fetch([$thour, "Ikebukuro", "InnerLoop"], 0)
    hugedelay22 = hugedelay.fetch([$thour, "Otsuka", "InnerLoop"], 0)
    hugedelay23 = hugedelay.fetch([$thour, "Sugamo", "InnerLoop"], 0)
    hugedelay24 = hugedelay.fetch([$thour, "Komagome", "InnerLoop"], 0)
    hugedelay25 = hugedelay.fetch([$thour, "Tabata", "InnerLoop"], 0)
    hugedelay26 = hugedelay.fetch([$thour, "NishiNippori", "InnerLoop"], 0)
    hugedelay27 = hugedelay.fetch([$thour, "Nippori", "InnerLoop"], 0)
    hugedelay28 = hugedelay.fetch([$thour, "Uguisudani", "InnerLoop"], 0)

    sumh2 = hugedelay21+hugedelay22+hugedelay23+hugedelay24+hugedelay25+hugedelay26+hugedelay27+hugedelay28
    # p sumh2

    get_cal_result_yamate = CalResultYamate.new(station_group: 12, this_hour: $thour, small_delay: sums2, huge_delay: sumh2, this_count: sum2)
    get_cal_result_yamate.save



# 外回り上野〜神田
    tmp31 = tmp.fetch([$thour, "Ueno", "InnerLoop"], 0)

tmp32 = tmp.fetch([$thour, "Okachimachi", "InnerLoop"], 0)
    tmp33 = tmp.fetch([$thour, "Akihabara", "InnerLoop"], 0)
    tmp34 = tmp.fetch([$thour, "Kanda", "InnerLoop"], 0)

    sum3 = tmp31+tmp32+tmp33+tmp34
    # p sum3

    smalldelay31 = smalldelay.fetch([$thour, "Ueno", "InnerLoop"], 0)
    smalldelay32 = smalldelay.fetch([$thour, "Okachimachi", "InnerLoop"], 0)
    smalldelay33 = smalldelay.fetch([$thour, "Akihabara", "InnerLoop"], 0)
    smalldelay34 = smalldelay.fetch([$thour, "Kanda", "InnerLoop"], 0)

    sums3 = smalldelay31+smalldelay32+smalldelay33+smalldelay34
    # p sums3

    hugedelay31 = hugedelay.fetch([$thour, "Ueno", "InnerLoop"], 0)
    hugedelay32 = hugedelay.fetch([$thour, "Okachimachi", "InnerLoop"], 0)
    hugedelay33 = hugedelay.fetch([$thour, "Akihabara", "InnerLoop"], 0)
    hugedelay34 = hugedelay.fetch([$thour, "Kanda", "InnerLoop"], 0)

    sumh3 = hugedelay31+hugedelay32+hugedelay33+hugedelay34
    # p sumh3

    get_cal_result_yamate = CalResultYamate.new(station_group: 13, this_hour: $thour, small_delay: sums3, huge_delay: sumh3, this_count: sum3)
    get_cal_result_yamate.save

# 外回り東京〜田町
    tmp41 = tmp.fetch([$thour, "Tokyo", "InnerLoop"], 0)
    tmp42 = tmp.fetch([$thour, "Yurakucho", "InnerLoop"], 0)
    tmp43 = tmp.fetch([$thour, "Shimbashi", "InnerLoop"], 0)
    tmp44 = tmp.fetch([$thour, "Hamamatsucho", "InnerLoop"], 0)
    tmp45 = tmp.fetch([$thour, "Tamachi", "InnerLoop"], 0)

    sum4 = tmp41+tmp42+tmp43+tmp44+tmp45
    # p sum4

    smalldelay41 = smalldelay.fetch([$thour, "Tokyo", "InnerLoop"], 0)
    smalldelay42 = smalldelay.fetch([$thour, "Yurakucho", "InnerLoop"], 0)
    smalldelay43 = smalldelay.fetch([$thour, "Shimbashi", "InnerLoop"], 0)
    smalldelay44 = smalldelay.fetch([$thour, "Hamamatsucho", "InnerLoop"], 0)
    smalldelay45 = smalldelay.fetch([$thour, "Tamachi", "InnerLoop"], 0)

    sums4 = smalldelay41+smalldelay42+smalldelay43+smalldelay44+smalldelay45
    # p sums4

    hugedelay41 = hugedelay.fetch([$thour, "Tokyo", "InnerLoop"], 0)
    hugedelay42 = hugedelay.fetch([$thour, "Yurakucho", "InnerLoop"], 0)
    hugedelay43 = hugedelay.fetch([$thour, "Shimbashi", "InnerLoop"], 0)
    hugedelay44 = hugedelay.fetch([$thour, "Hamamatsucho", "InnerLoop"], 0)
    hugedelay45 = hugedelay.fetch([$thour, "Tamachi", "InnerLoop"], 0)

    sumh4 = hugedelay41+hugedelay42+hugedelay43+hugedelay44+hugedelay45
    # p sumh4

    get_cal_result_yamate = CalResultYamate.new(station_group: 14, this_hour: $thour, small_delay: sums4, huge_delay: sumh4, this_count: sum4)
    get_cal_result_yamate.save

# 外回り品川〜恵比寿
    tmp51 = tmp.fetch([$thour, "Shinagawa", "InnerLoop"], 0)
    tmp52 = tmp.fetch([$thour, "Osaki", "InnerLoop"], 0)
    tmp53 = tmp.fetch([$thour, "Gotanda", "InnerLoop"], 0)
    tmp54 = tmp.fetch([$thour, "Meguro", "InnerLoop"], 0)
    tmp55 = tmp.fetch([$thour, "Ebisu", "InnerLoop"], 0)

    sum5 = tmp51+tmp52+tmp53+tmp54+tmp55
    # p sum5

    smalldelay51 = smalldelay.fetch([$thour, "Shinagawa", "InnerLoop"], 0)
    smalldelay52 = smalldelay.fetch([$thour, "Osaki", "InnerLoop"], 0)
    smalldelay53 = smalldelay.fetch([$thour, "Gotanda", "InnerLoop"], 0)
    smalldelay54 = smalldelay.fetch([$thour, "Meguro", "InnerLoop"], 0)
    smalldelay55 = smalldelay.fetch([$thour, "Ebisu", "InnerLoop"], 0)

    sums5 = smalldelay51+smalldelay52+smalldelay53+smalldelay54+smalldelay55
    # p sums5

    hugedelay51 = hugedelay.fetch([$thour, "Shinagawa", "InnerLoop"], 0)
    hugedelay52 = hugedelay.fetch([$thour, "Osaki", "InnerLoop"], 0)
    hugedelay53 = hugedelay.fetch([$thour, "Gotanda", "InnerLoop"], 0)
    hugedelay54 = hugedelay.fetch([$thour, "Meguro", "InnerLoop"], 0)
    hugedelay55 = hugedelay.fetch([$thour, "Ebisu", "InnerLoop"], 0)

    sumh5 = hugedelay51+hugedelay52+hugedelay53+hugedelay54+hugedelay55
    # p sumh5

get_cal_result_yamate = CalResultYamate.new(station_group: 15, this_hour: $thour, small_delay: sums5, huge_delay: sumh5, this_count: sum5)
    get_cal_result_yamate.save

# 外回り渋谷〜代々木
    tmp61 = tmp.fetch([$thour, "Shibuya", "InnerLoop"], 0)
    tmp62 = tmp.fetch([$thour, "Harajuku", "InnerLoop"], 0)
    tmp63 = tmp.fetch([$thour, "Yoyogi", "InnerLoop"], 0)

    sum6 = tmp61
    # p sum6

    smalldelay61 = smalldelay.fetch([$thour, "Shibuya", "InnerLoop"], 0)
    smalldelay62 = smalldelay.fetch([$thour, "Harajuku", "InnerLoop"], 0)
    smalldelay63 = smalldelay.fetch([$thour, "Yoyogi", "InnerLoop"], 0)

    sums6 = smalldelay61
    # p sums6

    hugedelay61 = hugedelay.fetch([$thour, "Shibuya", "InnerLoop"], 0)
    hugedelay62 = hugedelay.fetch([$thour, "Harajuku", "InnerLoop"], 0)
    hugedelay63 = hugedelay.fetch([$thour, "Yoyogi", "InnerLoop"], 0)

    sumh6 = hugedelay61
    # p sumh6

    get_cal_result_yamate = CalResultYamate.new(station_group: 16, this_hour: $thour, small_delay: sums6, huge_delay: sumh6, this_count: sum6)
    get_cal_result_yamate.save

    $thour = $thour + 1
  end
 end




end
