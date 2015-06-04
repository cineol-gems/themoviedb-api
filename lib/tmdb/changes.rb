module Tmdb
  class Changes < Struct

    def self.movie(filters={})
      result = Resource.new("/movie/changes", filters).get

      change = self.new(result.except('results'))
      change.results = result['results'].map do |result|
        Movie.new(result)
      end

      change
    end

    def self.person(filters={})
      result = Resource.new("/person/changes", filters).get

      change = self.new(result.except('results'))
      change.results = result['results'].map do |result|
        Person.new(result)
      end

      change
    end

    def self.tv(filters={})
      result = Resource.new("/tv/changes", filters).get

      change = self.new(result.except('results'))
      change.results = result['results'].map do |result|
        TV.new(result)
      end

      change
    end

  end
end
