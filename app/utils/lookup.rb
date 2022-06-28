module One
  def another
    puts "From one module"
  end
end

module Two
  def another
    puts "From two module"
  end
end

module Three
  def another
    puts "From three module"
  end
end

class Creature
  def another
    puts "From creature class"
  end
end

class Human < Creature
  # prepend Three
  extend Two
  include One

  def another
    puts "Instance method"
  end

  # def self.another
  #   puts "From Human class singleton"
  # end
end
