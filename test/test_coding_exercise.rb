require 'minitest/autorun'
require 'coding_exercise'

class CodingExerciseTest < Minitest::Test
  def setup
    @mul_jobs_with_order = CodingExercise.parce_jobs("a =>
      b => c
      c =>")
    @mul_jobs_with_multiple_orders = CodingExercise.parce_jobs("a => 
      b => c
      c => f
      d => a
      e => b
      f =>")

  end

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
    assert ['a','b','c'].to_set == @mul_jobs_with_order.split('').to_set
    assert @mul_jobs_with_order.index('c') < @mul_jobs_with_order.index('b')
  end

  def test_multiple_jobs_with_multiple_orders
    assert ['a','b','c','d','e','f'].to_set == @mul_jobs_with_multiple_orders.split('').to_set
    assert @mul_jobs_with_multiple_orders.index('f') < @mul_jobs_with_multiple_orders.index('c')
    assert @mul_jobs_with_multiple_orders.index('c') < @mul_jobs_with_multiple_orders.index('b')
    assert @mul_jobs_with_multiple_orders.index('b') < @mul_jobs_with_multiple_orders.index('e')
    assert @mul_jobs_with_multiple_orders.index('a') < @mul_jobs_with_multiple_orders.index('d')
  end

  def test_self_depended_jobs
    assert_raises "The job cannot depend on themselves." do
      CodingExercise.parce_jobs("a =>
          b =>
          c => c")
    end
  end

end

