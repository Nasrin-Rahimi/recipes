class Category < ActiveRecord::Base
    has_many :recipes

    def slug
        self.name.strip.gsub(' ', '-')
      end
    
      def self.find_by_slug(slug)
        name = slug.split('-').join(' ')
        Category.find_by(:name => name)
      end

end