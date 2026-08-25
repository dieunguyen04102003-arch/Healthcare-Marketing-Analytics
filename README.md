# Healthcare Appointment No-Show Analysis

## 1. About the project

This project analyzes healthcare appointment data to understand why patients miss
their appointments and identify patient groups that may need more attention.

The main focus of the analysis is:

- Overall No-show rate
- Patient demographics
- Waiting time
- SMS reminders
- Age groups
- Appointment weekdays
- Patient segments with higher No-show rates

The final goal is to find some practical insights that could help improve
appointment reminder strategies.

---

## 2. Dataset

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

I also created several new variables for the analysis:

- `Show_up`
- `Age_Group`
- `Waiting_group`
- `Appointment_Weekday`
- `Conditions`

---

## 3. Tools

### Python
Used for:

- Data cleaning
- Data type conversion
- Feature engineering
- Exploratory Data Analysis
- Initial data visualization

Libraries:
`Pandas` `NumPy` `Matplotlib` `Seaborn`

### SQL
Used to answer business questions and perform deeper analysis through:

- Aggregation
- CASE WHEN
- GROUP BY
- CTE
- Window functions
- Segmentation
- Cross-analysis

### Power BI
Used to build the final dashboard and present the main findings.

---

## 4. Analysis Process

```text
Raw Data
   ↓
Python
Cleaning + EDA
   ↓
SQL
Business Questions
   ↓
Power BI
Dashboard
   ↓
Insights & Recommendations
````

---

## 5. Business Questions

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

## 6. Key Findings

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

## 7. Recommendations

Based on the analysis, I would prioritize:

### 1. Long-waiting appointments

Appointments with **15+ days of waiting time** should receive more attention
because they have considerably higher No-show rates.

### 2. Patients without SMS coverage

Long-waiting appointments without SMS coverage are a particularly important
group to consider for targeted reminders.

### 3. Young Adults

Young Adults have the highest No-show rate among the age groups analyzed,
so they could be considered for more targeted communication.

### 4. Use multiple factors instead of gender alone

The difference between male and female No-show rates is small.
Waiting time, age and SMS coverage appear more useful for segmentation.

---

## 8. Power BI Dashboard

### Page 1 — Executive Overview

The first page summarizes:

* Total appointments
* Show-up rate
* No-show rate
* SMS coverage
* No-show rate by waiting time
* No-show rate by age group
* No-show rate by weekday
<img width="1163" height="645" alt="image" src="https://github.com/user-attachments/assets/12416c76-c2e2-43cc-8b1a-0e98986cf0fe" />

### Page 2 — Targeted Reminder Strategy

The second page focuses on:

* SMS coverage by waiting time
* No-show rate by waiting time and SMS status
* No-show rate among patients without SMS
* High-risk patient groups
* Reminder targeting opportunities
<img width="1168" height="654" alt="image" src="https://github.com/user-attachments/assets/2c089897-50e5-4d85-bfbf-5f8fb5560584" />

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

