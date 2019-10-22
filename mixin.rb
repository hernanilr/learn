# frozen_string_literal: true

# module Debug
module Debug
  def who?
    puts "#{self.class} (#{object_id}): #{type}"
  end
end

# class Phonograph
class Phonograph
  include Debug
  attr_accessor :type
  def initialize(type)
    @type = type
  end
end

# class EightTrack
class EightTrack
  include Debug
  attr_accessor :type
  def initialize(type)
    @type = type
  end
end

ph = Phonograph.new('West end Blues')
et = EightTrack.new('Surrealistic Pillow')
ph.who?
et.who?
