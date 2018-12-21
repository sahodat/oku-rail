class DelayJobanController < ApplicationController

  def delay_joban

@jobtest = OpdtJoban.group("HOUR(date)").group(:from_station).group(:direction).count
@jobtestdelay = OpdtJoban.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 0 and delay < 301").count
@jobtesthugedelay = OpdtJoban.group("HOUR(date)").group(:from_station).where("delay > 1200").count

    gon.jobtest = @jobtest
    gon.jobtestdelay = @jobtestdelay
    gon.jobtesthugedelay =@jobtesthugedelay


end
end
