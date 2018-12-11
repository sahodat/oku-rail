class DelayController < ApplicationController

def delay


    @jobancount = OpdtJoban.group("HOUR(date)").count
    @jobandelay0 = OpdtJoban.group("HOUR(date)").where("(delay = 0)").count
    @smalldelay = OpdtJoban.group("HOUR(date)").where("delay > 0 and delay < 301").count
    @hugedelay = OpdtJoban.group("HOUR(date)").where("delay > 900").count

end

end
