 def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0
  while i < collection.count do
    name == collection[i][:item] ? hash = collection[i] : nil
    i += 1
  end
  hash
end

def find_item_by_name_in_collection_l(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0
  while i < collection.count do
    name == collection[i][:item] ? hash = i : nil
    i += 1
  end
  hash
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  array = []
  i = 0
  while i < cart.count do
    name = cart[i][:item]
    exists = find_item_by_name_in_collection(name, array)
    l = find_item_by_name_in_collection_l(name, array)
    if exists
      array[l][:count] += 1
    else
      array << cart[i]
      array[-1][:count] = 1
    end
    i += 1
  end
  array
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0
  while i < coupons.count do
    name = coupons[i][:item]
    exists = find_item_by_name_in_collection(name, cart)
    l = find_item_by_name_in_collection_l(name, cart)
    hold = []
    if exists && coupons[i][:num] == cart[l][:count]
      cart[l][:item] = "#{cart[l][:item]} W/COUPON"
      cart[l][:price] = coupons[i][:cost] / coupons[i][:num]

    elsif exists && coupons[i][:num] < cart[l][:count]
      hold << cart[l]
      cart << hold
      cart[l][:count] = cart[l][:count] - coupons[i][:num]
      cart[-1][:item] = "#{cart[l][:item]} W/COUPON"
      cart[-1][:count] = coupons[i][:num]
      cart[-1][:price] = coupons[i][:cost] / coupons[i][:num]
    end
    i += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
