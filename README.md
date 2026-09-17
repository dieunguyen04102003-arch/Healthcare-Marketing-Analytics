# Healthcare Appointment No-Show Analysis

## 1. About the project

This project analyzes 110,527 healthcare appointment records to identify patterns associated with patient No-show behavior and determine patient segments with elevated No-show rates.

The project follows an end-to-end data analysis workflow using Python (Pandas) for data cleaning, preprocessing and feature engineering, SQL for cross-segment analysis, and Power BI for interactive dashboard development and visualization.

The analysis focuses on waiting time, patient demographics, SMS reminders, appointment weekdays, and patient segments associated with different No-show rates.

The final goal is to transform raw appointment data into structured analytical insights that could support more targeted appointment reminder strategies.
---

## 2. Dashboard Preview

### Page 1 — Executive Overview

<img width="1163" height="645" alt="image" src="https://github.com/user-attachments/assets/12416c76-c2e2-43cc-8b1a-0e98986cf0fe" />

The first page summarizes:

* Total appointments
* Show-up rate
* No-show rate
* SMS coverage
* No-show rate by waiting time
* No-show rate by age group
* No-show rate by weekday

### Page 2 — Targeted Reminder Strategy

<img width="1168" height="654" alt="image" src="https://github.com/user-attachments/assets/2c089897-50e5-4d85-bfbf-5f8fb5560584" />

The second page focuses on:

* SMS coverage by waiting time
* No-show rate by waiting time and SMS status
* No-show rate among patients without SMS
* High-risk patient groups
* Reminder targeting opportunities

---
## 3. Dataset

The dataset contains **110,527 medical appointments**.

Some of the main columns include:

- PatientId
- AppointmentID
- Gender
- ScheduledDay
- AppointmentDay
- Age
- Neighbourhood
- Hypertension
- Diabetes
- Alcoholism
- Handicap
- SMS_received
- No-show

Several analysis-ready features were created during preprocessing:

- `Show_up`
- `Age_Group`
- `Waiting_group`
- `Appointment_Weekday`
- `Conditions`

---

## 4. Tools

### 4.1. Python

Used for data cleaning, preprocessing, and feature engineering:

- Reviewed dataset structure, completeness, and data types
- Converted scheduling and appointment timestamps into appropriate datetime formats
- Checked AppointmentID for duplicate records
- Converted identifier fields into appropriate data types
- Calculated appointment waiting time
- Created analysis-ready features including Age_Group, Waiting_group, Appointment_Weekday, Show_up, and Conditions
- Prepared and exported the processed dataset for further analysis

Main library: Pandas

### 4.2. SQL

Used for analytical querying and cross-segment analysis:

- Calculated Show-up and No-show rates
- Compared No-show behavior across demographic and appointment characteristics
- Analyzed waiting-time and SMS reminder patterns
- Performed multi-dimensional segmentation across age, waiting time, and SMS status
- Identified patient groups with elevated No-show rates
- Used aggregations, CASE WHEN, window functions, and conditional calculations

### 4.3. Power BI
Used for interactive dashboard development and data visualization:

- Created KPI cards for appointment volume, Show-up rate, No-show rate, and SMS coverage
- Visualized No-show patterns across waiting time, age groups, and appointment weekdays
- Compared SMS coverage and No-show rates across patient segments
- Added interactive filters to support segment-level exploration
- Summarized key findings and actionable insights within the dashboard

---

## 5. Analysis Process

Raw Data
   ↓
Python / Pandas
Data Cleaning & Preprocessing
   ↓
Feature Engineering
   ↓
SQL
Analysis & Segmentation
   ↓
Power BI
Dashboard & Visualization
   ↓
Findings & Recommendations

---

## 6. Analysis Questions

Some of the main questions I explored:

1. What is the overall Show-up vs. No-show rate?
2. Does No-show behavior differ by gender?
3. Which age group has the highest No-show rate?
4. Does gender affect No-show behavior within different age groups?
5. Does longer waiting time relate to a higher No-show rate?
6. Which appointment weekdays have higher No-show rates?
7. Do patients who received SMS reminders have a different No-show rate?
8. Does the relationship between SMS reminders and No-show vary by age group?
9. Does the number of health conditions relate to No-show behavior?
10. Which patient segments have the highest No-show rate?
11. Which groups should be prioritized for targeted reminders?

---

## 7. Key Findings

### Overall attendance

* Total appointments: **110,527**
* Show-up rate: **79.81%**
* No-show rate: **20.19%**

Around 1 in 5 appointments was missed.

### Waiting time

Waiting time showed one of the clearest differences in No-show rate:

| Waiting group | No-show rate |
| ------------- | -----------: |
| 0–3 days      |        9.68% |
| 4–7 days      |       25.20% |
| 8–14 days     |       30.47% |
| 15–30 days    |       32.59% |
| 31+ days      |       33.03% |

Patients with longer waiting times had much higher No-show rates.

### Age

Young Adults had the highest No-show rate:

| Age group   | No-show rate |
| ----------- | -----------: |
| Young Adult |       24.65% |
| Under 18    |       21.90% |
| Adult       |       21.82% |
| Middle-Aged |       17.87% |
| Senior      |       15.31% |

### Gender

The difference between male and female patients was small:

* Female: **20.31%**
* Male: **19.97%**

So gender does not appear to be a strong standalone factor for identifying No-show risk.

### SMS reminders

Patients who received SMS had a higher observed No-show rate:

* SMS received: **27.57%**
* No SMS: **16.70%**

This result should not be interpreted as SMS causing more No-shows.
There may be differences between the groups that are not captured in the dataset.

When looking specifically at patients **without SMS**, No-show rate increased
with waiting time:

| Waiting group | No-show rate without SMS |
| ------------- | -----------------------: |
| 0–3 days      |                    9.47% |
| 4–7 days      |                   27.11% |
| 8–14 days     |                   33.76% |
| 15–30 days    |                   36.87% |
| 31+ days      |                   37.60% |

This was one of the main findings used for the final dashboard.

---

## 8. Recommendations

Based on the analysis, I would prioritize:

### 8.1. Long-waiting appointments

Appointments with **15+ days of waiting time** should receive more attention
because they have considerably higher No-show rates.

### 8.2. Long-waiting appointments without SMS coverage

Long-waiting appointments without SMS coverage are a particularly important
group to consider for targeted reminders.

### 8.3. Young Adults

Young Adults have the highest No-show rate among the age groups analyzed,
so they could be considered for more targeted communication.

### 8.4. Use multiple factors instead of gender alone

The difference between male and female No-show rates is small.
Waiting time, age and SMS coverage appear more useful for segmentation.

---


## 9. Limitations

This analysis is based on observational data, so the results show relationships
between variables rather than proving causation.

For example, the higher No-show rate among patients receiving SMS does not mean
that SMS reminders cause patients to miss appointments.

Some groups also have relatively small numbers of appointments, so their No-show
rates should be interpreted carefully.

---

## 10. Future Work

If more historical patient data were available, I would like to:

* Build a No-show prediction model
* Calculate patient-level attendance history
* Create a No-show risk score
* Test different reminder strategies
* Analyze the best timing for sending SMS reminders

---

