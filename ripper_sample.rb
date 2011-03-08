require "ripper"

# https://github.com/jimweirich/sorcerer, need to build gem by
# installing RedCloth gem and then doing rake gem, install manually
# from the generated gem after that.
#
require "sorcerer"

# Uncomment for a list of supported events, but pretty much 
# anything that is the first argument of a sexp can be made into
# an on_something hook.
#
# p Ripper::PARSER_EVENT_TABLE.keys.sort
# p Ripper::SCANNER_EVENTS.sort

class MyParser < Ripper::SexpBuilder
  def substitutions
    @substitutions ||= {}
  end

  def on_ivar(variable)
    super(substitutions[variable] || variable)
  end
end

sample_source = <<-EOS
  class Person
    def initialize(name)
      @name = name
    end

    def first_name
      @name.split(" ")[0]
    end

    def last_name
      @name.split(" ")[1]
    end
  end
EOS

parser = MyParser.new(sample_source)
parser.substitutions["@name"] = "@full_name"

puts Sorcerer.source(parser.parse) #=> OUTPUTS:
# class Person; def initialize(name)@full_name = name; end; def first_name
# @full_name.split(" ")[0]; end; def last_name @full_name.split(" ")[1]; end;
# end

