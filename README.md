# Healthcare-Marketing-Analytics

## 📌 Project Overview

Patient no-shows are an important operational challenge for healthcare providers. 
Missed appointments can lead to inefficient resource utilization, longer waiting times, 
and difficulties in managing healthcare capacity.

This project analyzes **110,527 medical appointments** to understand:

- How frequently patients miss scheduled appointments
- Which patient groups are more likely to no-show
- Whether waiting time is associated with appointment attendance
- Whether SMS reminders are reaching high-risk patients
- Which patient segments should be prioritized for targeted reminders

The project combines **Python, SQL, and Power BI** to move from data exploration 
to business insights and actionable recommendations.

---

## 🎯 Business Objective

The main objective is to identify **patterns associated with patient no-shows** 
and translate them into practical recommendations for targeted appointment reminders.

### Key Business Questions

1. What is the overall show-up vs. no-show rate?
2. How are appointments distributed by gender?
3. Does no-show behavior differ by gender?
4. Which age groups have the highest no-show rates?
5. Does gender affect no-show behavior within different age groups?
6. Does longer waiting time relate to a higher no-show rate?
7. Which appointment weekdays have higher no-show rates?
8. Do patients who received SMS reminders have a different no-show rate?
9. Does the relationship between SMS reminders and no-show vary by age group?
10. Does the number of health conditions relate to no-show behavior?
11. Which neighbourhoods have higher no-show rates?
12. Which patient segments have the highest no-show rates?
13. Which patient segments should be prioritized for targeted reminders?
14. Within high-risk groups, how many appointments are not covered by SMS reminders?

---

# 📊 Dataset

The dataset contains information about patients and their scheduled medical appointments.

### Main Variables

| Variable | Description |
|---|---|
| `PatientId` | Unique patient identifier |
| `AppointmentID` | Unique appointment identifier |
| `Gender` | Patient gender |
| `ScheduledDay` | Date and time when the appointment was scheduled |
| `AppointmentDay` | Date of the appointment |
| `Age` | Patient age |
| `Neighbourhood` | Location of the healthcare facility |
| `Scholarship` | Whether the patient receives financial assistance |
| `Hypertension` | Whether the patient has hypertension |
| `Diabetes` | Whether the patient has diabetes |
| `Alcoholism` | Whether the patient has an alcoholism indicator |
| `Handcap` | Handicap indicator |
| `SMS_received` | Whether an SMS reminder was received |
| `No-show` | Whether the patient missed the appointment |

Additional analytical features were created during the project, including:

- `Show_up`
- `Age_Group`
- `Waiting_group`
- `Appointment_Weekday`
- `Conditions`

---

# 🛠️ Tools & Technologies

### Python
Used for:

- Data cleaning
- Data type conversion
- Feature engineering
- Exploratory Data Analysis (EDA)
- Identifying initial patterns and anomalies

Libraries:

- Pandas
- NumPy
- Matplotlib
- Seaborn

### SQL

Used for:

- Aggregating appointment data
- Calculating No-show rates
- Segmenting patients
- Cross-analysis between demographic and behavioral variables
- Identifying high-risk patient segments
- Supporting business questions with structured queries

### Power BI

Used for:

- KPI development
- Interactive dashboard creation
- Patient risk segmentation
- SMS coverage analysis
- Communicating insights to non-technical stakeholders

---

# 🔄 Analytical Approach

The project follows a three-stage analytical workflow:

```text
Raw Data
   ↓
Python
Data Cleaning & EDA
   ↓
SQL
Business Question Analysis
   ↓
Power BI
Interactive Dashboard
   ↓
Insights & Recommendations
````

---

# 🧹 1. Data Preparation & Feature Engineering

Several variables were created to support the analysis.

### Show-up Indicator

The original `No-show` variable was transformed into a binary `Show_up` variable:

* `1` → Patient attended the appointment
* `0` → Patient did not attend

### Age Groups

Patients were grouped into meaningful age segments:

* Under 18
* Young Adult
* Adult
* Middle-Aged
* Senior

### Waiting Time

The number of days between scheduling and appointment was grouped into:

* 0–3 days
* 4–7 days
* 8–14 days
* 15–30 days
* 31+ days

### Number of Health Conditions

A `Conditions` variable was created by combining:

* Hypertension
* Diabetes
* Alcoholism
* Handicap

This variable was used to explore whether the number of recorded health conditions
was associated with appointment attendance.

---

# 📈 2. Key Findings

## Overall Appointment Attendance

Out of **110,527 appointments**:

* **79.81%** were attended
* **20.19%** resulted in No-show

This means approximately **1 in 5 appointments was missed**.

---

## ⏳ Waiting Time Is Strongly Associated with No-show

No-show rates increased substantially as the waiting period became longer:

| Waiting Group | No-show Rate |
| ------------- | -----------: |
| 0–3 days      |        9.68% |
| 4–7 days      |       25.20% |
| 8–14 days     |       30.47% |
| 15–30 days    |       32.59% |
| 31+ days      |       33.03% |

The difference between short- and long-waiting appointments is substantial.

Appointments scheduled **31+ days in advance had more than three times the No-show rate**
of appointments with only 0–3 days of waiting.

### Business implication

Waiting time should be considered an important factor when designing appointment reminder strategies.

---

## 👥 Age Differences

Young Adults showed the highest No-show rate:

| Age Group   | No-show Rate |
| ----------- | -----------: |
| Young Adult |       24.65% |
| Under 18    |       21.90% |
| Adult       |       21.82% |
| Middle-Aged |       17.87% |
| Senior      |       15.31% |

Young Adult patients therefore represent an important segment for further investigation
and targeted communication.

---

## ⚧️ Gender Has Limited Impact

No-show rates were very similar between genders:

* Female: **20.31%**
* Male: **19.97%**

Although females account for a larger share of appointments, the difference in No-show rate
is relatively small.

### Business implication

Gender alone is unlikely to be an effective targeting variable for reminder campaigns.

---

## 📱 SMS Reminder Coverage

Only around **32.10% of appointments received an SMS reminder**.

Interestingly, the raw No-show rate among patients who received SMS was higher than among
those who did not:

* SMS received: **27.57%**
* No SMS: **16.70%**

This does **not** necessarily mean that SMS reminders increase No-show.

Patients receiving SMS may already differ systematically from those who do not, for example
because of appointment timing or other operational factors.

Therefore, the relationship should be interpreted as an **association rather than causation**.

---

## 📱 SMS Coverage & Waiting Time

SMS coverage varied substantially by waiting group.

Short-waiting appointments had very high SMS coverage, while longer-waiting appointments
had considerably lower coverage.

This creates an important operational opportunity:

> Patients with longer waiting periods tend to have higher No-show risk, while SMS coverage
> is lower in these groups.

This suggests that reminder resources could be better aligned with appointment risk.

---

## 🚨 High-Risk Patients Without SMS

Among patients who did not receive SMS, No-show rates increased sharply with waiting time:

| Waiting Group | No-show Rate Without SMS |
| ------------- | -----------------------: |
| 0–3 days      |                    9.47% |
| 4–7 days      |                   27.11% |
| 8–14 days     |                   33.76% |
| 15–30 days    |                   36.87% |
| 31+ days      |                   37.60% |

This indicates that **long-waiting appointments without SMS coverage represent a particularly
high-risk segment**.

---

# 💡 Business Recommendations

Based on the analysis, several actions can be considered.

### 1. Prioritize long-waiting appointments

Appointments scheduled **15+ days in advance** should receive additional reminder attention.

These appointments consistently show substantially higher No-show rates.

---

### 2. Improve SMS coverage for high-risk appointments

Rather than distributing reminders uniformly, the hospital could prioritize:

```text
Long waiting time
        +
No SMS coverage
        ↓
High-priority reminder
```

This would allow reminder resources to be concentrated on appointments with higher observed risk.

---

### 3. Consider age-based targeting

Young Adult patients show higher No-show rates than older age groups.

Reminder communication could therefore be adapted to different age segments instead of using
a completely uniform communication strategy.

---

### 4. Avoid using gender as the primary targeting variable

Because male and female No-show rates are very similar, gender should not be treated as the
main risk indicator.

It may be more useful as a secondary segmentation variable.

---

### 5. Move from blanket reminders toward risk-based reminders

The overall objective should be to move from:

> **"Send reminders to everyone."**

toward:

> **"Prioritize reminders for appointments with higher observed No-show risk."**

Potential targeting variables include:

* Waiting time
* SMS coverage
* Age group
* Previous attendance behavior (if historical patient-level data is available)

---

# 📊 Power BI Dashboard

The Power BI report contains two main pages.

## Page 1 — Executive Overview

The first page provides a high-level view of appointment attendance and identifies
the major No-show patterns.

It includes:

* Total appointments
* Show-up rate
* No-show rate
* SMS coverage
* No-show rate by waiting time
* No-show rate by age group
* No-show rate by weekday
* Key business findings

### Main question

> **What is happening with patient attendance?**

---

## Page 2 — Targeted Reminder Strategy

The second page focuses on identifying patient groups that could benefit from targeted
reminder strategies.

It analyzes:

* SMS coverage by waiting time
* No-show rate by waiting time and SMS status
* No-show rate among patients without SMS
* High-risk patient segments
* Targeted reminder opportunities

### Main question

> **Where should the hospital focus its reminder efforts?**

---

# 📁 Project Structure

```text
Healthcare-Marketing-Analytics/
│
├── data/
│   └── healthcare_appointments.csv
│
├── python/
│   └── healthcare_eda.ipynb
│
├── sql/
│   └── healthcare_analysis.sql
│
├── powerbi/
│   └── healthcare_no_show_analysis.pbix
│
├── images/
│   ├── dashboard_page_1.png
│   └── dashboard_page_2.png
│
└── README.md
```

---

# ⚠️ Limitations

This analysis identifies **associations**, not causal relationships.

For example, the higher No-show rate among patients receiving SMS does not mean that
SMS reminders cause patients to miss appointments.

Several factors may influence the observed relationship, including:

* Appointment scheduling patterns
* Waiting time
* Patient characteristics
* Operational reminder policies
* Other variables not available in the dataset

Additionally, some neighbourhoods have very small appointment volumes.
High No-show rates in these groups should therefore be interpreted carefully.

---

# 🚀 Future Improvements

If additional patient-level historical data were available, the analysis could be extended to:

* Build a patient-level No-show prediction model
* Calculate historical attendance rate by patient
* Develop a risk score for upcoming appointments
* Estimate the expected number of missed appointments
* Compare reminder effectiveness using controlled experiments
* Optimize SMS timing based on patient risk and waiting time

A future version could therefore move from:

```text
Descriptive Analytics
        ↓
Risk Segmentation
        ↓
Predictive Analytics
        ↓
Targeted Intervention
```

