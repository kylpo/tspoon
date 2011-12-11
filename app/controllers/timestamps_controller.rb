require 'hashtimestamper'
require 'filetimestamper'

class TimestampsController < ApplicationController
  def index
    @timestamps = [1, 2]
  end

  def create
    if(params.has_key?(:hash_input))
      timestamp = HashTimestamper.new( params[:hash_input] )
      Timestamp.create( :value => timestamp.doTimestamp )
    elsif (params.has_key?(:file_input))
      timestamp = FileTimestamper.new( params[:file_input] )
      Timestamp.create( :value => timestamp.doTimestamp )
    else
      raise 'ERROR: Input (file or hash) required'
    end
  end
end
