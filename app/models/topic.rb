class Topic < ApplicationRecord
    
 belongs_to :genre
 
 has_many :comments
 
 has_and_belongs_to_many :tags
end
