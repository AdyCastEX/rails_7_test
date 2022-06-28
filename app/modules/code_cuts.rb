module CodeCuts
  def self.included(base)
    base.extend(self)
  end

  def codecuts(&block)
    code_cut = CodeCut.new
    code_cut.instance_eval(&block)
  end
end

class CodeCut
  def initialize
    @num_topics = 0
  end

  attr_accessor :num_topics

  def topic(title, &block)
    @num_topics += 1
    puts "Code Cuts ##{@num_topics} \n\n"

    puts "Team Code Cuts presents: #{title} \n\n"

    topic = Topic.new(title)
    topic.instance_eval(&block)
  end
end

class Topic
  require 'date'

  def initialize(title)
    @title = title
  end

  attr_reader :title

  def details(&block)
    details_hash = Details.new
    details_hash.instance_eval(&block)

    host = details_hash.attributes[:host]
    date = Date.parse(details_hash.attributes[:date]).strftime("%A, %b %d")
    time = details_hash.attributes[:time].gsub(" ", "")
    puts "#{host} will be teaching us #{@title} this #{date}, #{time} \n\n"
  end
end

class Details
  def initialize
    @attributes = {}
  end

  attr_accessor :attributes

  def method_missing(name, *args, &block)
    @attributes[name] = args[0]
  end
end
