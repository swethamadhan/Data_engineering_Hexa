#Python task2 (27-08-24)

#1. List operations
numbers = [1, 2, 3, 4, 5]

# Append the number 6
numbers.append(6)

# Remove the number 3
numbers.remove(3)

# Insert the number 0 at the beginning
numbers.insert(0, 0)

# Print the final list
print(numbers)

#2.Tuple operations
coordinates = (10.0, 20.0, 30.0)

# Access and print the second element
print(coordinates[1])

# Trying to change an element in a tuple results in a TypeError
try:
  coordinates[2] = 40.0
except TypeError:
  print("Tuples are immutable. You cannot change elements directly.")

#3.Set operations
fruits = {"apple", "banana", "cherry"}

# Add "orange" to the set
fruits.add("orange")

# Remove "banana" from the set
fruits.remove("banana")

# Check if "cherry" is in the set
if "cherry" in fruits:
    print("Cherry is in the set.")

# Create a citrus set
citrus = {"orange", "lemon", "lime"}

# Perform union and intersection
fruit_union = fruits.union(citrus)
fruit_intersection = fruits.intersection(citrus)

print("Union:", fruit_union)
print("Intersection:", fruit_intersection)

#4.Dictionary Operations
person = {"name": "John", "age": 30, "city": "New York"}

# Access and print the "name" key
print(person["name"])

# Update the "age" key
person["age"] = 31

# Add a new key-value pair
person["email"] = "john@example.com"

# Remove the "city" key
del person["city"]

# Print the final dictionary
print(person)

#5.Nested dictionary
school = {
  "Alice": {"Math": 90, "Science": 85},
  "Bob": {"Math": 78, "Science": 92},
  "Charlie": {"Math": 95, "Science": 88}
}

# Print Alice's Math grade
print(school["Alice"]["Math"])

# Add a new student David
school["David"] = {"Math": 80, "Science": 89}

# Update Bob's Science grade
school["Bob"]["Science"] = 95

# Print the final school dictionary
print(school)

#6.List Comprehension
numbers = [1, 2, 3, 4, 5]
squared_numbers = [num**2 for num in numbers]

print(squared_numbers)

#7. Set Comprehension
numbers = [1, 2, 3, 4, 5]
squared_set = {num**2 for num in numbers}

print(squared_set)

#8.Dictionary Comprehension
cubes = {num: num**3 for num in range(1, 6)}
print(cubes)

#9.Combining Collections
keys = ["name", "age", "city"]
values = ["Alice", 25, "Paris"]
combined_dict = dict(zip(keys, values))

print(combined_dict)

#10.Count Word Occurrences
sentence = "the quick brown fox jumps over the lazy dog the fox"
word_count = {}
words = sentence.split()

for word in words:
  word_count[word] = word_count.get(word, 0) + 1

print(word_count)

#11.Unique Elements in Two Sets
set1 = {1, 2, 3, 4, 5}
set2 = {4, 5, 6, 7, 8}

unique_elements = set1.union(set2)
common_elements = set1.intersection(set2)
only_in_set1 = set1.difference(set2)

print("Unique elements:", unique_elements)
print("Common elements:", common_elements)
print("Elements only in set1:", only_in_set1)

#12.Tuple Unpacking
person = ("Alice", 25, "Paris")
name, age, city = person

print(name, age, city)

#13.Frequency Counter with Dictionary
text = "hello world"
letter_count = {}

for letter in text:
  letter_count[letter] = letter_count.get(letter, 0) + 1

print(letter_count)

#14.Sorting a List of Tuples
students = [("Alice", 90), ("Bob", 80), ("Charlie", 85)]
sorted_students = sorted(students, key=lambda x: x[1], reverse=True)

print(sorted_students)