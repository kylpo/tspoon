class TimestampsController < ApplicationController
  def create
    @timestamp = Hashtimestamper.new
    # Timestamp.create( :value => @timestamp.doTimestamp )

  end
end
