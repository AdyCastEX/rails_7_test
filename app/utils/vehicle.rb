class Vehicle
  prepend Repair

  def initialize(kms, plate_number)
    @kms = kms
    @plate_number = plate_number
  end

  attr_accessor :kms, :plate_number

  def accelerate
    puts "Accelerating..."
  end

  def self.register(vehicle)
    puts "Registered Vehicle..."
  end

  class << self
    def find(plate_number)
      puts "Finding vehicle #{plate_number}..."
    end
  end
end
