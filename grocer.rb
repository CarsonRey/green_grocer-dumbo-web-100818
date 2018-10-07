require 'pry'
 def consolidate_cart(cart)
  cart.each do |item_hash|
    item_hash.each do |item, info_hash|
        binding.pry
       if !cart[item][:count]
         cart[item][:count] += 1
       elsif hash[item].include?(key) == false
         hash[item][key] = value
       end
    end
  end
  cart
end

 # [
 #     {:item => "AVOCADO", :num => 2, :cost => 5.00},
 #     {:item => "BEER", :num => 2, :cost => 20.00},
  #    {:item => "CHEESE", :num => 3, :cost => 15.00}
  #  ]


def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num] # cart[name] is a 'truthy' value, basically asking if it exists
      if cart["#{name} W/COUPON"]                     # <-- initially tried this while looping over the cart which isn't possible
        cart["#{name} W/COUPON"][:count] += 1         # checking the double if statements and editing the original cart rules out any 
      else                                             #  need for describing original items
        
      cart["#{name} W/COUPON"] = {
        :count => 1,
        :price => coupon[:cost],
        :clearance => cart[name][:clearance]
      }
      end
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
end



def apply_clearance(cart)
 cart.each do |item, item_hash|
    item_hash.each do |key, value|
        if cart[item][:clearance] == true && key == :price
           cart[item][:price] = value - (value * 0.20)
        else
           next
        end
    end
  end
  cart
end

def array_of_prices(cart) #creates an array of prices so we can add them together to                         make the total
  prices = []
   cart.each do |item, item_hash|
    item_hash.each do |key, value|
        if key == :price
        prices << value
      end
    end
  end
prices
end

def checkout(cart, coupons)
     cart = consolidate_cart(cart: cart)
     cart = apply_coupons(cart: cart, coupons: coupons)
     cart = apply_clearance(cart: cart)
     
  cart.each do |item, item_hash|
  end
end

