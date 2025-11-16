
# Uber Ride Analysis using Python
# Author: Shaksham Saini

import pandas as pd
import matplotlib.pyplot as plt

# 1. Load dataset
df = pd.read_csv("uber_data.csv")  # Replace with actual file name

# 2. Basic Cleaning
df['ride_timestamp'] = pd.to_datetime(df['ride_timestamp'])
df['hour'] = df['ride_timestamp'].dt.hour
df['date'] = df['ride_timestamp'].dt.date

# 3. Summary Statistics
total_rides = len(df)
total_revenue = df['fare_amount'].sum()
avg_fare = df['fare_amount'].mean()

# 4. Peak Hour Analysis
peak_hour = (
    df.groupby('hour')['ride_id']
    .count()
    .sort_values(ascending=False)
)

# 5. Average Fare by Location
avg_fare_location = (
    df.groupby('pickup_location')['fare_amount']
    .mean()
    .sort_values(ascending=False)
)

# 6. Plot: Rides per Hour
plt.figure(figsize=(10,5))
df.groupby('hour')['ride_id'].count().plot(kind='bar')
plt.title("Rides Per Hour")
plt.xlabel("Hour of Day")
plt.ylabel("Total Rides")
plt.tight_layout()
plt.savefig("rides_per_hour.png")

# 7. Save Outputs
peak_hour.to_csv("peak_hour_analysis.csv")
avg_fare_location.to_csv("avg_fare_by_location.csv")

# 8. Final Print Statements
print("Total Rides:", total_rides)
print("Total Revenue:", total_revenue)
print("Average Fare:", avg_fare)
print("Peak Hour Analysis Saved to CSV")
print("Average Fare by Location Saved to CSV")

