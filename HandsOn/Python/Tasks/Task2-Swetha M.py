###  1: Create a Dictionary
person = {
    "Name": "Alice",
    "Age": 25,
    "City": "New York"
}

print(person)


### Exercise 2: Access Dictionary Elements
print(person["Name"])
print(person["City"])


### Exercise 3: Add and Modify Elements
person["email"] = "alice@example.com"
person["Age"] = 26

print(person)


### Exercise 4: Remove Elements
del person["City"]

print(person)


### Exercise 5: Check if a Key Exists
if "email" in person:
    print("The 'email' key exists in the dictionary.")
else:
    print("The 'email' key does not exist in the dictionary.")  # This won't be printed

if "phone" in person:
    print("The 'phone' key exists in the dictionary.")
else:
    print("The 'phone' key does not exist in the dictionary.")


### Exercise 6: Loop Through a Dictionary
# 1. Iterate over key-value pairs
for key, value in person.items():
    print(f"{key}: {value}")

# 2. Iterate over keys
for key in person:
    print(key)

# 3. Iterate over values
for value in person.values():
    print(value)


### Exercise 7: Nested Dictionary
employees = {
    101: {"name": "Bob", "job": "Engineer"},
    102: {"name": "Sue", "job": "Designer"},
    103: {"name": "Tom", "job": "Manager"}
}

print(f"Employee with ID 102: {employees[102]}")

employees[104] = {"name": "Linda", "job": "HR"}

print(employees)

### Exercise 8: Dictionary Comprehension
squares = {num: num**2 for num in range(1, 6)}

print(squares)


### Exercise 9: Merge Two Dictionaries
dict1 = {"a": 1, "b": 2}
dict2 = {"c": 3, "d": 4}

dict1.update(dict2)

print(dict1)


### Exercise 10: Default Dictionary Values
number_map = {"a": 1, "b": 2, "c": 3}

value_b = number_map.get("b")  # value_b will be 2
value_d = number_map.get("d", 0)  # value_d will be 0 (default)

print(value_b, value_d)


### Exercise 11: Dictionary from Two Lists
keys = ["name", "age", "city"]
values = ["Eve", 29, "San Francisco"]

person_dict = dict(zip(keys, values))

print(person_dict)


### Exercise 12: Count Occurrences of Words (continued)
def count_words(sentence):
    words = sentence.lower().split()  # Convert to lowercase and split into words
    word_counts = {}
    for word in words:
        if word in word_counts:
            word_counts[word] += 1
        else:
            word_counts[word] = 1
    return word_counts

sentence = "the quick brown fox jumps over the lazy dog the fox"
word_counts = count_words(sentence)

print(word_counts)