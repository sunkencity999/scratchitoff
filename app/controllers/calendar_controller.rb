class CalendarController < ApplicationController

  @events_by_date = Event.group_by(&:date)

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
