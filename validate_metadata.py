import pandas as pd
import os

df = pd.read_csv("metadata/metadata.csv")

print("Checking metadata...\n")

# Missing values
print("Missing values:")
print(df.isnull().sum(), "\n")

# File existence
missing = []
for _, row in df.iterrows():
    if not os.path.exists("raw_data/" + row["forward_read"]):
        missing.append(row["forward_read"])
    if not os.path.exists("raw_data/" + row["reverse_read"]):
        missing.append(row["reverse_read"])

if not missing:
    print("All files exist ✅")
else:
    print("Missing files ❌:")
    print(missing)

print("\nTotal samples:", len(df))
