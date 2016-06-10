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

    def test_shouting #all caps, exclaimation
        remark = 'WATCH OUT!'
        assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
    end

    def test_shouting_gibberish # alll caps (no exclaimation)
        remark = ('A'..'Z').to_a.shuffle[0, 10].join
        assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
    end

    def test_asking_a_question #ends w/ ?
        remark = 'Does this cryogenic chamber make me look fat?'
        assert_equal 'Sure.', bob.hey(remark), feedback(remark)
    end

    def test_asking_a_numeric_question #ends w/ ?
        remark = 'You are, what, like 15?'
        assert_equal 'Sure.', bob.hey(remark), feedback(remark)
    end

    def test_asking_gibberish #ends w/ ?
        remark = ('a'..'z').to_a.shuffle[0, 10].join << '?'
        assert_equal 'Sure.', bob.hey(remark), feedback(remark)
    end

    def test_talking_forcefully #! but not yelling (ending w/ ! is nonevent)
        remark = "Let's go make out behind the gym!"
        assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
    end

    def test_using_acronyms_in_regular_speech #not all caps, but some caps
        remark = "It's OK if you don't want to go to the DMV."
        assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
    end

    def test_forceful_questions #all caps over ending w/ ? yelling needs to come before questions
        remark = 'WHAT THE HELL WERE YOU THINKING?'
        assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
    end

    def test_shouting_numbers #all caps
        remark = '1, 2, 3 GO!'
        assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
    end

    def test_only_numbers #counts as all caps, so need to make all caps exclude all numbers
        remark = '1, 2, 3'
        assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
    end

    def test_question_with_only_numbers #question needs to be ends w/ ?
        remark = '4?'
        assert_equal 'Sure.', bob.hey(remark), feedback(remark)
    end

    def test_shouting_with_special_characters #all caps, special characters irrelevant
        remark = 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
        assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
    end

    def test_shouting_with_no_exclamation_mark #again - yelling is defined by all caps
        remark = 'I HATE YOU'
        assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
    end

    def test_statement_containing_question_mark # question must END w/ ?, not just contain it
        remark = 'Ending with ? means a question.'
        assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
    end

    def test_prattling_on # end w/ question. ! irrelevant
        remark = 'Wait! Hang on. Are you going to be OK?'
        assert_equal 'Sure.', bob.hey(remark), feedback(remark)
    end

    def test_silence #silence of any length
        remark = ''
        assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
    end

    def test_prolonged_silence
        remark = ' ' * rand(1..10)
        assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
    end

    def test_alternate_silences
        remark = "\t" * rand(1..10)
        assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
    end

    def test_on_multiple_line_questions
        remark = %(
Does this cryogenic chamber make me look fat?
no)
        assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
    end
end
