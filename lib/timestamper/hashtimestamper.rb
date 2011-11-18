# JDW Nov 17 2011 - HashTimestamper only accepts well-formed, hexidecimal character SHA1 hashs and submits a TSQ to the default TS authority (StartCom now)
require 'tempfile'
require 'timestamper'
require 'openssldispatcher'

class HashTimestamper < Timestamper

	def getHash()
		return @hash
	end

	def initialize(hash, hashAlg='SHA1', hashFmt='HEX', timestampAuthority='http://www.startssl.com/timestamp')
		if hashAlg=='SHA1' and (hash.length != 40 or hash !~ /[0-9A-Fa-f]{40}/i)
			raise "HEY - you specified an invalid hash length or the hash characters are not hex!"
		elsif hashAlg != 'SHA1'
			raise "Hash algorithm #{hashAlg} is not yet supported!"
		end
		@hash = hash
		@hashAlg = hashAlg
		@hashFmt = hashFmt
		@timestampAuthority = timestampAuthority
	end
	
	def doTimestamp()
		#generate tmp file for tsq, tsr
		tsqTmpFile = Tempfile.new("TS_tsq")
		tsrTmpFile = Tempfile.new("TS_tsr")
		
		OpensslDispatcher.doCreateTSQFromHash(@hash, tsqTmpFile)
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
