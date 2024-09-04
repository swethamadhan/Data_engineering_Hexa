#JSON tasks

#1.Reading JSON file
import json

with open("data.json", "r") as f:
    data = json.load(f)

print(data)

#2.Writing JSON file
import json

profile = {
    "name": "Jane Smith",
    "age": 28,
    "city": "Los Angeles",
    "hobbies": ["Photography", "Traveling", "Reading"]
}

with open("profile.json", "w") as f:
    json.dump(profile, f, indent=4)

#3. Converting  CSV to JSON
import csv
import json

with open("students.csv", "r") as csv_file:
    csv_reader = csv.DictReader(csv_file)
    data = [row for row in csv_reader]

with open("students.json", "w") as json_file:
    json.dump(data, json_file, indent=4)

#4. Converting JSON to CSV
import json
import csv

with open("data.json", "r") as json_file:
    data = json.load(json_file)

if isinstance(data, dict):  # For a single dictionary
    with open("data.csv", "w", newline="") as csv_file:
        fieldnames = data.keys()
        csv_writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        csv_writer.writeheader()
        csv_writer.writerow(data)
elif isinstance(data, list):  # For a list of dictionaries
    with open("data.csv", "w", newline="") as csv_file:
        fieldnames = data[0].keys()
        csv_writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        csv_writer.writeheader()
        csv_writer.writerows(data)

#5. Nested JSON Parsing
import json

with open("books.json", "r") as f:
    data = json.load(f)

for book in data["books"]:
    print(book["title"])