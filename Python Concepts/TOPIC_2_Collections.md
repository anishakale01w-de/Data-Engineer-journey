TOPIC 2: Collections (List, Tuple, Dictionary, Set)

1. List
Formal Definition: A list is an ordered, mutable collection of items enclosed in square brackets [].
It allows duplicate values and elements can be of mixed data types. Lists support indexing, slicing,
and a wide range of built-in methods for adding, removing, and modifying elements.

order_ids = ["ORD001", "ORD002", "ORD003", "ORD001"]

Real life memory 😄 An Amazon order log — order IDs come in one after another, in sequence, and the same order ID can technically repeat if logged twice by mistake. That's a List.

Important interview note: Lists are mutable — meaning the original list changes when you use .append(), .remove(), .sort(). No new list is created.
