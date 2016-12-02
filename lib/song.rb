class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.new.save
  end

  def artist_name=(name)
    @artist_name = name
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    song = self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].strip.chomp(".mp3")
    song.artist_name =  filename.split(" - ")[0].strip.chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end


  def save
    self.class.all << self
    self
  end

end
