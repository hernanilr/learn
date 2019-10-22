# frozen_string_literal: true

b_song = KaraokeSong.new('My Way', 'Sinatra', 225, 'And now, the...')
puts b_song.to_s

a_song = Song.new('Bicylops', 'Fleck', 460)
puts a_song.to_s

puts b_song.play
puts b_song.play
puts a_song.play
puts a_song.play
puts a_song.play

puts SongList.toolong?(a_song)

list = SongList.new
list
  .append(Song.new('title1', 'artist1', 1))
  .append(Song.new('title2', 'artist2', 2))
  .append(Song.new('title3', 'artist3', 3))
  .append(Song.new('title4', 'artist4', 4))

puts list[0]
puts list['title4']

medium = Volume.new(4)..Volume.new(7)
puts "\n\nteste Volume.new(4)..Volume.new(7)"
puts medium.to_a.inspect
puts 'inclui 3: ' + medium.include?(Volume.new(3)).to_s
puts 'inclui 6: ' + medium.include?(Volume.new(6)).to_s
