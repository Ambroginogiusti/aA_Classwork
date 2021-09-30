class Instructor < ApplicationRecord
  
  belongs_to :course,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :Course

    

end