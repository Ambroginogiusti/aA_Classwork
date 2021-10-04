class Player

  def initialize(name)
    @name = name
  en
  
  def guess
    puts "type a string: "
    gets.chomp
  end

 def alert_invalid_guess(guess)
  puts "your guess, #{guess},  was invalid!"
 end

end