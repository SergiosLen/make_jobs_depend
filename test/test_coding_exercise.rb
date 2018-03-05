require 'minitest/autorun'
require 'coding_exercise'

class CodingExerciseTest < Minitest::Test
  def test_empty_string
    assert_equal "" , CodingExercise.parce_jobs('')
  end

  def test_single_job
    assert_equal "a", CodingExercise.parce_jobs('a =>')
  end
  def test_multiple_jobs

    assert ['a','b','c'].to_set == CodingExercise.parce_jobs("a =>
b =>
c =>").split('').to_set
  end
  def test_multiple_jobs_with_order
    assert ['a','b','c'].to_set == CodingExercise.parce_jobs("a =>
b => c
c =>").split('').to_set
    assert  CodingExercise.parce_jobs("a =>
b => c
c =>").include?('cb')
  end

end

