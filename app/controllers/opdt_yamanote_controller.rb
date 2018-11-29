 class Opdt_yamanoteController < ApplicationController

    def index
      @records = Record.all
    end

    def new
    end

    def create
      Record.create(id: params[:o_id], type: params[:o_type], date: params[:date], context: params[:context], valid:[:o_valid], :delay params[:delay], :odptindex params[:opdt_index], :sameas params[:same_as], :railway params[:railway], :operator params[:tostation], params[:to_station], :traintype params[:train_type], :fromstaiton params[:from_station], :trainnumber params[:train_number], :direction params[:direction], :composition params[:composition], :destination params[:destinantion_station])
    end

  end
