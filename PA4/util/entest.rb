
def testen
    lst = [1, 2, 3, 4]
    en = lst.each
    num1 = en.next
    puts "#{num1}"
    en2 = testnext(en)
    num3 = en.next
    num4 = en2.next
    puts "#{num3}"
    puts "#{num4}"
    if en2 === en
        puts "SAME"
    end
end

def testnext(en)
    num2 = en.next
    return en
end

testen
for i in 0..4
    puts "#{i}"
end


class TestClass
    def initialize
        @myi = 2
    end
    def dostuff
        delegate
    end
    def delegate
        puts "got here #{@myi}"
    end

    def to_s
        return 'yoyoyo'
    end
end
TestClass.new.dostuff
puts "#{TestClass.new}\n\n"

puts "#{[2, 3, [].join("-")].join("*")}"
puts "#{["", ""].join("*")}"
