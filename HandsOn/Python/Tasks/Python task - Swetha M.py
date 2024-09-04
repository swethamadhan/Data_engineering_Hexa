#1.Create a List

fruits = ["apple", "banana", "cherry", "date", "elderberry"]
print(fruits)

#2.Access List Elements
#Print the first and last items from the fruits list.
print(fruits[0])  # First item
print(fruits[-1])  # Last item

#Print the second and fourth items from the list.
print(fruits[1])  # Second item
print(fruits[3])  # Fourth item

#3.Modify a List
fruits[1] = "blueberry"
print(fruits)

#4.Add and Remove Elements
#Append "fig" and "grape" to the fruits list.
fruits.append("fig")
fruits.append("grape")

#Remove "apple" from the list.
fruits.remove("apple")

#Print the final list.
print(fruits)


#5.Slice a List
first_three_fruits = fruits[:3]
print(first_three_fruits)

#6.Find List Length
print(len(fruits))

#7.List Concatenation
vegetables = ["carrot", "broccoli", "spinach"]
food = fruits + vegetables
print(food)

#8.Loop Through a List
for fruit in fruits:
    print(fruit)

#9.Check for Membership
for fruit in ["cherry", "mango"]:
    print(f"{fruit} is in the fruits list." if fruit in fruits else f"{fruit} is not in the fruits list.")

#10.List Comprehension
fruit_lengths = [len(fruit) for fruit in fruits]
print(fruit_lengths)

#11.Sort a list

#Sort the fruits list in alphabetical order and
# print it.

fruits.sort()
print(fruits)

#Sort the fruits list in reverse
# alphabetical order and print it.
fruits.sort(reverse=True)
print(fruits)

#12.Nested lists
nested_list = [fruits[:3], fruits[-3:]]
print(nested_list[1][0])

#13.Remove Duplicates
numbers = [1, 2, 2, 3, 4, 4, 4, 5]

unique_numbers = list(set(numbers))
print(unique_numbers)

#14.Split and Join Strings
#Split the string "hello, world, python, programming" into a list
# called words using the comma as a delimiter.
string = "hello, world, python, programming"
words = string.split(",")
print(words)

#Join the words list back into a string using
# a space as the separator and print it.
joined_string = " ".join(words)
print(joined_string)
