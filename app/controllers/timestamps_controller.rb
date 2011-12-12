require 'hashtimestamper'
require 'filetimestamper'

class TimestampsController < ApplicationController
  def index
    @timestamps = Timestamp.all
  end

  def create
    if (params.has_key?(:file_input))
      timestamp = FileTimestamper.new( params[:file_input] )
      Timestamp.create( :value => timestamp.doTimestamp )
      redirect_to timestamps_path
    elsif(params.has_key?(:hash_input))
      timestamp = HashTimestamper.new( params[:hash_input] )
      Timestamp.create( :value => timestamp.doTimestamp )
      redirect_to timestamps_path
    else
      raise 'ERROR: Input (file or hash) required'
    end
  end

  def show
    send_data Timestamp.find(params[:id]).value
  end
end
