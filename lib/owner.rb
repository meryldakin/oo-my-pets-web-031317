require'pry'

class Owner
  # variables
  @@all = []
  @@count = 0


  def initialize(name)
    @name = name
    @species = "human"
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }
    @@all << self
    @@count += 1
  end
  ### class methods ###
  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end

  ### instance methods ###
  attr_reader :species

  attr_accessor :name, :pets

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)

  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)

  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species, animal_array|
      animal_array.each do |animal|
        animal.mood = "nervous"
      end
    end
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }

  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."

  end

end
