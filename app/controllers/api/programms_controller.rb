class Api::ProgrammsController < ApplicationController
  
  def index
    #Define Params that can be used in the call
    date = params[:date] rescue nil
    time_from = params[:time_from] rescue nil
    time_to = params[:time_from] rescue nil
    channel = params[:channel] rescue nil
    show_type = params[:showtype] rescue nil

    #Build Date Conditions
    date_conditions = "programms.date = " + date.to_s if date rescue nil
    time_conditions = "programms.time between " + time_from + "and " + time_to if time_from && time_to
    
    #Build Channel Conditions
    if channel
      channel_find = Channel.where("name = ?", channel).to_ary
      if !channel_find.blank?
        channel_conditions = "channel_id = " + channel_find[0].id.to_s
      end
    end
    #Build Filter Condtions for Showtypes
    if show_type
      showtype_find = ShowType.where("name = ?", show_type).to_ary
      shows = Show.where("show_type_id = ?", showtype_find[0].id).to_ary
      show_ids = get_ids(shows)
      episodes = Episode.find_by_sql("select * from episodes where show_id in " + show_ids)
      episode_ids = get_ids(episodes)
      type_conditions = "episode_id in " + episode_ids
    end
    
    #Combine conditions to Find Programms
    conditions = ""
    conditions = date_conditions.to_s + " and " if date_conditions
    conditions = conditions + time_conditions + " and " if time_conditions
    conditions = conditions + channel_conditions + " and " if channel_conditions
    conditions = conditions + type_conditions if type_conditions
    conditions = conditions.chomp('and ')
    
    #Find Programms
    if !conditions.blank?
      @programms = Programm.find_by_sql("select * from programms where " + conditions + "order by date asc, timeslot asc")
    else
      @programms = Programm.all
    end
    
    #Render JSON with results
    render json: @programms


  end
  #Method to extract a string with ids for filtering Purposes
  def get_ids(array)
    ids = "("
    array.each do |me|
      ids << me.id.to_s + ","
    end
    ids = ids.chomp(",")
    ids = ids + ")"
    return ids

  end


end
