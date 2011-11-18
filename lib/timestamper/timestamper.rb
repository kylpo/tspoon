#JDW - Nov 17 2011 - Timestamper Abstract Class (use concrete classes that subtype this for impl)

class Timestamper
	def initialize()
		raise 'ERROR: Cant instantiate abstract timestamper class :('
	end
	
	def doTimestamp()
		raise 'ERROR: Cant call doTimestamp on abstract timestamper class :('
	end

end
