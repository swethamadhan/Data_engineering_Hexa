import pandas as pd
# Sample DataFrame
df = pd.DataFrame({
    'employee_id': [1, 2, 2, 3, 3, 3],
    'department': ['HR', 'IT', 'IT', 'Finance', 'Finance', 'Finance'],
    'salary': [50000, 60000, 62000, 55000, 58000, 60000]
})
#Group by department and calculate mean salary
grouped_df = df.groupby('department') ['salary'].mean().reset_index()
print(grouped_df)