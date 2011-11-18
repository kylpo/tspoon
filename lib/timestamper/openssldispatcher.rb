#JDW Nov 17 2011 - OpensslDispatcher - send query to openssl, abstracting away command-line options and various other vehavior

class OpensslDispatcher
	@@tsgetCommand = '/usr/lib/ssl/misc/tsget -h %s -o %s %s' # % TSauthority, outputFilePath, inputFilePath 
	@@tsqCommand = "openssl ts -query %s %s -out %s -sha1" #1st arg needs to be applicable command line switch -in or -digest based on type of input

	def self.doCreateTSQFromHash(hash, tsqTmpFile)
                unless system(@@tsqCommand % ["-digest", hash, tsqTmpFile.path]) and $?.exitstatus == 0
                        raise "Openssl TS query did not run properly!"
                end
	end

	def self.doCreateTSQFromTmpFile(tmpFile, tsqTmpFile)
		unless system(@@tsqCommand % ["-in", tmpFile.path, tsqTmpFile.path]) and $?.exitstatus == 0
                        raise "Openssl TS query did not run properly!"
                end
	end

	def self.doCreateTSRFromTSQ(tsAuthority, tsqTmpFile, tsrTmpFile)
		unless system(@@tsgetCommand % [tsAuthority, tsqTmpFile, tsrTmpFile]) and $?.exitstatus == 1
			raise "Openssl TSGET supplemental script failed!"
		end
	end
end
