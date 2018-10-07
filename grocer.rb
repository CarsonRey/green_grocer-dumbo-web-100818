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
 new_cart = {}
 cart.each do |item, item_hash|
  coupons.each do |coupon_hash|
    coupon_hash.each do |key, value|
     if item == coupon_hash[:item]
      new_cart["#{item} W/COUPON"] = {
                  :price => coupon_hash[:cost],
                  :clearance => true,
                  :count => cart[item][:count] / coupon_hash[:num] }
      new_cart[item] = {
                :price => cart[item][:price],
                :clearance => true, 
                :count => cart[item][:count] - coupon_hash[:num]}     
     else
        new_cart[item] = item_hash
      end
      
  end
end
end
new_cart
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

