class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum:2, maximum:50 }
    validates :description, presence: true, length: { minimum: 5, maximum:200 }

    belongs_to :user
end
