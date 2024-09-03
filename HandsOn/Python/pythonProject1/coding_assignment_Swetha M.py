#1: Creating DataFrame from Scratch
import pandas as pd

data = {
    "Product": ['Laptop', 'Mouse', 'Monitor', 'Keyboard', 'Phone'],
    "Category": ['Electronics', 'Accessories', 'Electronics', 'Accessories', 'Electronics'],
    "Price": [80000, 1500, 20000, 3000, 40000],
    "Quantity": [10, 100, 50, 75, 30]
}

df = pd.DataFrame(data)
print(df)

# 2: Basic DataFrame Operations
# Display the first 3 rows
print(df.head(3))

# Display column names and index
print(df.columns)
print(df.index)

# Display summary statistics
print(df.describe())

#3: Selecting Data
# Select "Product" and "Price" columns
selected_df = df[['Product', 'Price']]
print(selected_df)

# Select rows where "Category" is "Electronics"
electronics_df = df[df['Category'] == 'Electronics']
print(electronics_df)

#4: Filtering Data
# Filter products with price greater than 10,000
filtered_df1 = df[df['Price'] > 10000]
print(filtered_df1)

# Filter products with "Accessories" category and quantity greater than 50
filtered_df2 = df[(df['Category'] == 'Accessories') & (df['Quantity'] > 50)]
print(filtered_df2)

#5.Adding and Removing Columns
# Add "Total Value" column
df['Total Value'] = df['Price'] * df['Quantity']

# Drop "Category" column
df = df.drop(columns=['Category'])
print(df)
