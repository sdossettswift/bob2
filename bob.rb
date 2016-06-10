class Bob
    def hey(remark)
        ##SILENCE
        if (remark == remark.reverse)
            'Fine. Be that way!'
            ##ALL CAPS (But not all numbers)
        elsif (remark == remark.upcase) && (remark.downcase != remark.upcase)
            'Whoa, chill out!'
            ##QUESTION
        elsif remark.end_with?("?")
            'Sure.'
            ##CATCHALL
        else
            'Whatever.'
        end
    end
end

bob = Bob.new
puts bob.hey "Howdy!"
puts bob.hey "What's up?"
puts bob.hey "LEAVE ME ALONE!"
puts bob.hey "8675309"
puts bob.hey "          "
