require 'test_helper'

class CardinalityTest < Test::Unit::TestCase
  # Replace this with your real tests.
  def test_a_floats_cardinality
		assert_equal 10.0.cardinalize, "North"
		assert_equal 310.5.cardinalize, "Northwest"
		assert_equal 175.2.cardinalize, "South"
		assert_equal 40.0.cardinalize, "Northeast"
		assert_equal -40.0.cardinalize, "Northwest"
		assert_equal 600.5.cardinalize, "Southwest"
  end

  def test_an_integer_cardinality
		assert_equal 10.cardinalize, "North"
		assert_equal 310.cardinalize, "Northwest"
		assert_equal 175.cardinalize, "South"
		assert_equal 40.cardinalize, "Northeast"
		assert_equal -40.cardinalize, "Northwest"
		assert_equal 600.cardinalize, "Southwest"
  end

  def test_a_strings_cardinality
		assert_equal "10".cardinalize, "North"
		assert_equal "310".cardinalize, "Northwest"
		assert_equal "175".cardinalize, "South"
		assert_equal "40".cardinalize, "Northeast"
		assert_equal "-40".cardinalize, "Northwest"
		# to_f makes this 0.0
		assert_equal "aaaaaaa".cardinalize, "North"
  end

	def test_an_arrays_cardinality
		courses = 10.times.inject([]){|a,i|a << rand(360).to_f}
		assert_equal courses.cardinalize, courses.collect{|i| i.cardinalize}
	end
end
