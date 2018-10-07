require 'pry'
 def consolidate_cart(cart)
  hash = {}
  cart.each do |item_hash|
    item_hash.each do |item, info_hash|
      info_hash.each do |key, value|
       if hash[item] == nil
         hash[item] = {key => value, :count => cart.count(item_hash)}
       elsif hash[item].include?(key) == false
         hash[item][key] = value
       end
      end
    end
  end
  hash
end



def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    name = coupon[:item]
  end


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

def checkout(cart, coupons)
  cart.each do |item, item_hash|
    item_hash.each do |key, value|
  end
end
end

