class Song
    attr_accessor :name, :artist_name
    @@all = []

    def self.all
        @@all
    end

    def self.create
        new.save
    end

    def self.new_by_name(name)
        song = new
        song.name = name
        song
    end

    def self.create_by_name(name)
        song = new_by_name(name)
        song.save
    end

    def self.find_by_name(name)
        all.detect { |song| song.name == name }
    end

    def self.find_or_create_by_name(name)
        all.each do |song|
            return song if song.name == name
        end
        song = create_by_name(name)
    end

    def self.alphabetical
        all.sort_by(&:name)
    end

    def self.new_from_filename(filename)
        song = new
        song.name = filename.split(' - ')[1].strip.chomp('.mp3')
        song.artist_name = filename.split(' - ')[0].strip.chomp('.mp3')
        song
    end

    def self.create_from_filename(filename)
        song = new_from_filename(filename)
        song.save
    end

    def self.destroy_all
        all.clear
    end

    def save
        self.class.all << self
        self
    end
end
