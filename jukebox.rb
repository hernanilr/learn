# frozen_string_literal: true

# cancao
class Song
  include Comparable
  attr_accessor :name, :artist, :duration

  # class instance variables need to be initialize
  @plays = 0

  class << self
    # this accessor is for class instance variables
    attr_accessor :plays
  end

  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
  end

  def play
    @plays += 1
    Song.plays += 1
    "This song: #{@name}-#{@plays} plays. Total #{Song.plays} plays."
  end

  def to_s
    "Song: #{@name}--#{@artist} (#{@duration})"
  end

  def duration_minutes
    @duration / 60.0 # force floating point
  end

  def duration_minutes=(value)
    @duration = (value * 60).to_i
  end

  def <=>(other)
    duration <=> other.duration
  end

  def [](frt, tot)
    result = Song.new(title + ' [extract]',
                      artist,
                      tot - frt)
    result.setStartTime(frt)
    result
  end
end

# cancao karaoke
class KaraokeSong < Song
  attr_accessor :lyrics

  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end

  def to_s
    super + " [#{@lyrics}]"
  end
end

# logger
class Logger
  private_class_method :new
  def self.create
    @logger ||= new
    @logger
  end
end

# para representar volume
class Volume
  include Comparable

  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end

  def inspect
    '#' * @volume
  end

  # Support for ranges
  def <=>(other)
    volume <=> other.volume
  end

  def succ
    raise(IndexError, 'Volume too big') if @volume > 9

    Volume.new(@volume.succ)
  end
end

# module Inject
module Inject
  attr_accessor :myvar

  class << self
    attr_accessor :sc_var
  end

  def inject(nnn)
    each { |s| nnn = yield(nnn, s.duration) }
    nnn
  end

  def sum(ini = 0)
    inject(ini) { |e, v| e + v }
  end
end

# lista concoes
class SongList
  include Inject

  MAXTIME = 5 * 60 # 5 minutes

  def initialize
    @songs = []
    self.myvar = 0
    Inject.sc_var = 0
    append(Song.new('s1', 'a1', 1000))
    append(Song.new('s2', 'a2', 2000))
    append(Song.new('s3', 'a3', 3000))
    append(Song.new('s4', 'a4', 4000))
    append(Song.new('s5', 'a5', 5000))
  end

  def self.toolong?(song)
    song.duration > MAXTIME
  end

  def append(song)
    @songs.push(song)
    self.myvar += song.duration
    self
  end

  def delete_first
    @songs.shift
  end

  def delete_last
    @songs.pop
  end

  def each
    if block_given?
      # produz novo array com resultados do block
      @songs.map { |e| yield e }
    else
      # with no block enumerator is returned
      # for external iteration
      @songs.each
    end
  end

  def [](key)
    return @songs[key] if key.is_a?(Integer)

    @songs.find { |s| key == s.name }
  end
end
