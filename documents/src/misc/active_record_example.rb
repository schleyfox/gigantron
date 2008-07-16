### @export "Simplest Model"
class Bear < ActiveRecord::Base
end
### @end
### @export "Simple Usage"
bear = Bear.new
bear.color = "brown"
bear.age = 6
bear.mood = "angry" #they are always angry
bear.save
### @end
### @export "Simple association"
class Bear < ActiveRecord::Base
  has_many :claws
end

class Claw < ActiveRecord::Base
  belongs_to :bear
end
### @end

