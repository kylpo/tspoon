# JDW Nov 17 2011 - FileTimestamper takes an *already created* tmp file with the data to timestamp and processes it
require 'tempfile'
require 'timestamper'
require 'openssldispatcher'

class FileTimestamper < Timestamper

	def getHash()
		return @hash
	end

	def initialize(file, timestampAuthority='http://www.startssl.com/timestamp')
		@file = file #an already-instantiated tmp file object
		@timestampAuthority = timestampAuthority
	end
	
	def doTimestamp()
		#generate tmp file for tsq, tsr
		tsqTmpFile = Tempfile.new("TS_tsq")
		tsrTmpFile = Tempfile.new("TS_tsr")
		
		OpensslDispatcher.doCreateTSQFromTmpFile(@file, tsqTmpFile)
		OpensslDispatcher.doCreateTSRFromTSQ(@timestampAuthority, tsqTmpFile, tsrTmpFile)
		tsrTmpFile.rewind
		retVal = tsrTmpFile.read
		tsqTmpFile.close
		tsrTmpFile.close
		tsqTmpFile.unlink
		tsrTmpFile.unlink
		return retVal	
	end
end
