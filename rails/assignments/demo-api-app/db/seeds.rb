6.times do |i|
  category = Category.create(name: "category - #{i}")
  10.times do |j|
    category.products.create(name: "product - #{j}", price: rand(100..500))
  end
end
