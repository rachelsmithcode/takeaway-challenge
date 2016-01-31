class Item

  attr_reader :price

  def initialize(name, price, reference)
    @name = name
    @price = price
    @reference = reference
  end

  def name
    @name.clone
  end

  def reference
    @reference.clone
  end

end




#could possibly be done as a struct but since if this were expanded there would probably be photos and other details like if an item is out of stock
#contained within item I think it will be worth creating it as a class from the begginning.
#Station = Struct.new(:name, :zone)
