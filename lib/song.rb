require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
  song = self.new
    song.save
    song
end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  song.save
  song
end

def self.find_by_name(name)
  @@all.find do |song|
      song.name == name
  end

end

def self.find_or_create_by_name(name)
  self.create_by_name(name)
  self.find_by_name(name)
end

def self.alphabetical
  @@all.sort_by(&:name)
end

def self.new_from_filename(band_song)
    x = band_song.split(/\ - |\./)
    artist_name = x[0] 
    name = x[1] 
    
   song = self.new
   song.artist_name = artist_name
   song.name = name
   song
end

def self.create_from_filename(band_song)
  x = band_song.split(/\ - |\./)
    artist_name = x[0] 
    name = x[1] 
    
   song = self.new
   song.artist_name = artist_name
   song.name = name
   song.save
   song
end

def self.destroy_all
  @@all.clear
end
end
