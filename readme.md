Given a test suite, can you make the code in bob.rb pass? (spoiler: YOU CAN. YOU WILL)

    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    Bob answers 'Sure.' if you ask him a question.
    He answers 'Whoa, chill out!' if you yell at him.
    He says 'Fine. Be that way!' if you address him without actually saying anything.
    He answers 'Whatever.' to anything else. Instructions
    Run the test file, and fix each of the errors in turn. When you get the first test to pass, go to the first pending or skipped test, and make that pass as well. When all of the tests are passing, feel free to submit.
    Remember that passing code is just the first step. The goal is to work towards a solution that is as readable and expressive as you can make it.
    Please make your solution as general as possible. Good code doesn't just pass the test suite, it works with any input that fits the specification.

Notes:

    To run a test file: ruby bob_test.rb
    To make a test not be pending, you should remove the "skip" from the test definition

    Homework is taken from exercism.io

bob.rb

class Bob
end

bob_test.rb

require 'minitest/autorun'
require_relative 'bob'

class BobTest < Minitest::Test
  def bob
    ::Bob.new
  end

  def feedback(text)
    "Bob hears #{text.inspect}, and.."
  end

  def test_stating_something
    remark = 'Tom-ay-to, tom-aaaah-to.'
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_shouting
    skip
    remark = 'WATCH OUT!'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_shouting_gibberish
    skip
    remark = ('A'..'Z').to_a.shuffle[0, 10].join
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_asking_a_question
    skip
    remark = 'Does this cryogenic chamber make me look fat?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_asking_a_numeric_question
    skip
    remark = 'You are, what, like 15?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_asking_gibberish
    skip
    remark = ('a'..'z').to_a.shuffle[0, 10].join << '?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_talking_forcefully
    skip
    remark = "Let's go make out behind the gym!"
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_using_acronyms_in_regular_speech
    skip
    remark = "It's OK if you don't want to go to the DMV."
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_forceful_questions
    skip
    remark = 'WHAT THE HELL WERE YOU THINKING?'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_shouting_numbers
    skip
    remark = '1, 2, 3 GO!'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_only_numbers
    skip
    remark = '1, 2, 3'
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_question_with_only_numbers
    skip
    remark = '4?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_shouting_with_special_characters
    skip
    remark = 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_shouting_with_no_exclamation_mark
    skip
    remark = 'I HATE YOU'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_statement_containing_question_mark
    skip
    remark = 'Ending with ? means a question.'
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_prattling_on
    skip
    remark = 'Wait! Hang on. Are you going to be OK?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_silence
    skip
    remark = ''
    assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
  end

  def test_prolonged_silence
    skip
    remark = ' ' * rand(1..10)
    assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
  end

  def test_alternate_silences
    skip
    remark = "\t" * rand(1..10)
    assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
  end

  def test_on_multiple_line_questions
    skip
    remark = %(
Does this cryogenic chamber make me look fat?
no)
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end
end
