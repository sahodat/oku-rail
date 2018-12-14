class DelayController < ApplicationController

def delay

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



end

end
