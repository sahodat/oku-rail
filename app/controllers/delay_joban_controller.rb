class DelayJobanController < ApplicationController

  def delay_joban

    @job = OpdtJoban.group("HOUR(date)").group(:from_station).group(:direction).count
    @jobdelay = OpdtJoban.group("HOUR(date)").group(:from_station).group(:direction).where("delay > 0 and delay < 301").count
    @jobhugedelay = OpdtJoban.group("HOUR(date)").group(:from_station).where("delay > 900").count

    gon.job = @job
    gon.jobdelay = @jobdelay
    gon.jobhugedelay = @jobhugedelay

  end
end
