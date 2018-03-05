require 'minitest/autorun'
require 'coding_exercise'

class CodingExerciseTest < Minitest::Test
  def test_empty_string
    assert_equal "" , CodingExercise.parce_jobs('')
  end
end