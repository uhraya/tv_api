class Api::ProgrammsController < ApplicationController
  before_action :set_programm, only: [:show, :update, :destroy]

  def get_programm
    date = params[:date] rescue nil
    time_from = params[:time_from] rescue nil
    time_to = params[:time_from] rescue nil
    channel = params[:channel] rescue nil
    show_type = params[:showtype] rescue nil


    date_cond = "programms.date = " + date.to_s if date rescue nil
    time_cond = "programms.time between " + time_from + "and " + time_to if time_from && time_to
    
    if channel
      channel_find = Channel.where("name = ?", channel).to_ary
      channel_cond = "channel_id = " + channel[0].id
    end
    
    if show_type
      showtype_find = ShowType.where("name = ?", show_type).to_ary
      shows = Show.where("show_type_id =", showtype_find[0].id).to_ary
      show_ids = shows.get_ids
      episodes = Episode.find_by_sql("select * from episodes where show_id in " + show_ids)
      episode_ids = episodes.get_ids
      type_cond = "episode_id in " + episode_ids
    end
    
    cond = date_cond.to_s + " and " if date_cond
    cond = cond + time_cond + " and " if time_cond
    cond = cond + channel_cond + " and " if channel_cond
    cond = cond + type_cond

    @programms = Programm.find_by_sql("select * from programms where " + cond + "order by date asc, timeslot asc")

    render json: @programms


  end

  private

  def get_ids
    ids = "("
    self.each do |me|
      ids << me.id.to_s + ","
    end
    ids = ids.chomp(",")
    ids = ids + ")"
    return ids

  end


end
