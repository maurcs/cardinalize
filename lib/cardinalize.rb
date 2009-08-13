module Cardinalize
	
	CARDINAL_DIRECTIONS = %w{North Northeast East Southeast South Southwest West Northwest}
	
	# returns a cardinal direction from any float or integer
	def cardinalize
		if self.is_a?(Array)
			return self.collect{|i|i.cardinalize}
		end
		closest = degrees.min { |a,b| (a-course).abs <=> (b-course).abs }
		closest = 0.0 if closest == degrees.last
		cardinal[closest]
	end
	
	private
	# returns a Hash of {:degree => "Human Direction"}
	def cardinal
		i=0
		@cardinal ||= CARDINAL_DIRECTIONS.inject({}) do |h, dir|
			degree = (i*(360.to_f/CARDINAL_DIRECTIONS.length.to_f)).to_f
			i+=1
			h[degree] = dir
			h
		end
	end
	
	# returns an actual course (0.0 to 360.0) from any float or integer positive or negative
	def course
		return @course if @course
		c = self.to_f
		c = c%360.0 if c.abs>360
		@course = c<0 ? (360.0-(c*-1.0)) : c
	end
	
	#returns the degrees from the cardinal hash
	def degrees
		@degrees ||= cardinal.keys.sort + [360.0]
	end
	
end

class Integer; include Cardinalize; end
class Float; include Cardinalize; end
class String; include Cardinalize; end
class Array; include Cardinalize; end