TOPIC 2: Collections (List, Tuple, Dictionary, Set)

1. List
Formal Definition: A list is an ordered, mutable collection of items enclosed in square brackets [].
It allows duplicate values and elements can be of mixed data types. Lists support indexing, slicing,
and a wide range of built-in methods for adding, removing, and modifying elements.

order_ids = ["ORD001", "ORD002", "ORD003", "ORD001"]

Real life memory 😄 An Amazon order log — order IDs come in one after another, in sequence, and the same order ID can technically repeat if logged twice by mistake. That's a List.

Important interview note: Lists are mutable — meaning the original list changes when you use .append(), .remove(), .sort(). No new list is created.

order_ids = ["ORD001", "ORD002", "ORD003"]

# Indexing
print(order_ids[0])        # ORD001 (first item)
print(order_ids[-1])       # ORD003 (last item)

# Slicing
print(order_ids[0:2])      # ['ORD001', 'ORD002']

# Add item
order_ids.append("ORD004")
print(order_ids)           # ['ORD001', 'ORD002', 'ORD003', 'ORD004']

# Remove item
order_ids.remove("ORD002")
print(order_ids)           # ['ORD001', 'ORD003', 'ORD004']

# Length
print(len(order_ids))      # 3

# Sort
prices = [299, 99, 450, 120]
prices.sort()
print(prices)               # [99, 120, 299, 450]

# Loop through list
for order in order_ids:
    print(order)


    

2. Tuple
Formal Definition: A tuple is an ordered, immutable collection of items enclosed in round brackets (). Once created, its elements cannot be changed, added, or removed. Tuples are generally faster than lists and used to store fixed/constant data.
--revised 7th july

