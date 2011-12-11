require "#{Rails.root}/lib/timestamper/timestamper.rb"
# require "#{Rails.root}/lib/timestamper/filetimestamper.rb"
# Dir["#{Rails.root}/lib/timestamper/*.rb"].each {|file| require file }

class TimestampsController < ApplicationController
  def create
    @timestamp = Timestamper.new(
    Timestamp.create( :value => @timestamp.doTimestamp )

  end
end
