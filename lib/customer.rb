class Customer

attr_accessor :name, :age

@@all = []

def initialize(name, age)
    @name = name
    @age = age
    @@all << self
end

def self.all
    @@all
end

def new_meal(waiter, total, tip=0) #creates new meal as customer and automatically associate each meal with the customer that created it
    Meal.new(waiter, self, total, tip) #passing self as a reference to current instance of customer
end

def meals #customer looks at all the meals then selects one that belongs to them
    Meal.all.select do |meal| #iterate through every instance of meal 
        meal.customer == self  #returning ones where the meals customer matches the current customer instance
    end
end

def waiters
    meals.map do |meal|
        meal.waiter
    end
end
  
end