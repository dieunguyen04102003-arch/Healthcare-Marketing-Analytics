select *
from health_mar;

--1. What is the overall show-up vs. no-show rate?
select Show_up, count(*) as total_appoints,
		cast(round(count(*) * 100.0 / sum(count(*)) over(), 2) as decimal(10,2))
			as show_up_rate
from health_mar
group by Show_up;

--2. How are appointments distributed by gender?
select Gender, count(*) as total_appointments,
		cast(round(count(*) * 100.0 / sum(count(*)) over(), 2) as decimal(10,2))
			as per_appointments
from health_mar
group by Gender;

---3. Does no-show behavior differ by gender?
select Gender, count(*) as total_appointments,
		sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
		cast(round(sum(case when Show_up = 0  then 1 else 0 end)
						 * 100.0/ count(*), 2
					) as decimal(10,2)
			) as no_show_rate
from health_mar
group by  Gender;

--4. Which age group has the highest no-show rate?
select Age_Group, count(*) as total_appointments, 
		sum(
			case when Show_up = 0 then 1 else 0 end
			) as no_show_count,
		cast(
			round(
				sum(case when Show_up = 0 then 1 else 0 end) * 100.0 / count(*), 2
				) as decimal(10,2)
			)
		as no_show_rate
from health_mar
group by Age_Group
order by no_show_rate DESC;

--5. Does gender affect no-show behavior within different age groups?
select Gender, Age_Group, count(*) as total_appointments,
		sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
		cast(round(sum(case when Show_up = 0 then 1 else 0 end) * 100.0 / count(*), 2
					) as decimal(10,2)
			) as no_show_rate
from health_mar
group by Gender, Age_Group
order by Gender, no_show_rate DESC

--6. Does longer waiting time relate to a higher no-show rate?
select Waiting_group, count(*) as total_appointments,
		sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
		cast(round(sum(case when Show_up = 0  then 1 else 0 end) * 100.0 / count(*), 2
					) as decimal(10,2)
			)as no_show_rate
from health_mar
group by Waiting_group
order by no_show_rate DESC;

--7. Which appointment weekdays have the highest no-show rate?
select Appointment_Weekday, count(*) as total_appointments,
		sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
		cast(round(sum(case when Show_up = 0 then 1 else 0 end) * 100.0 / count(*), 2
					) as decimal(10,2)	
			) as no_show_rate
from health_mar
group by Appointment_Weekday
order by no_show_rate DESC;

--8. Do patients who received SMS reminders have a different no-show rate?
select SMS_received, count(*) as total_appointments, 
		sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
		cast(round(sum(case when Show_up = 0 then 1 else 0 end)  * 100.0 / count(*), 2
					) as decimal(10,2)
			) as no_show_rate
from health_mar
group by SMS_received
order by no_show_rate DESC;

--9. Does the relationship between SMS reminders and no-show vary by age group?
select SMS_received, Age_Group, count(*) as total_appointments,
		sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
		cast(round(sum(case when Show_up = 0  then 1 else 0 end) * 100.0 / count(*), 2
					) as decimal(10,2)
			) as no_show_rate
from health_mar
group by SMS_received, Age_Group
order by SMS_received, no_show_rate DESC;

--10. Does the number of health conditions relate to no-show behavior?
select Conditions,  count(*) as total_appointments,
		sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
		cast(round(sum(case when Show_up = 0 then 1 else 0 end) * 100.0 / count(*), 2
					) as decimal(10,2)
			) as no_show_rate
from health_mar
group by Conditions
order by no_show_rate DESC;

--11. Which neighbourhoods have the highest no-show rates?
select top 10 Neighbourhood, count(*) as total_appointments,
		sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
		cast(round(sum(case when Show_up = 0 then 1 else 0 end) * 100.0 / count(*), 2
					) as decimal(10,2)
			) as no_show_rate
from health_mar
group by Neighbourhood
order by no_show_rate DESC;
--12. Which patient segments have the highest no-show rate?
select Age_Group, Waiting_group, SMS_received,
		count(*) total_appointments,
		sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
		cast(round(sum(case when Show_up = 0 then 1 else 0 end) * 100.0 / count(*), 2
					) as decimal(10,2)
			) as no_show_rate
from health_mar
group by Age_Group, Waiting_group, SMS_received
order by no_show_rate DESC;

--13. Trong nhóm waiting ≥ 15 ngày, bệnh viện đã gửi SMS cho bao nhiêu % bệnh nhân?
select Waiting_group, count(*) as total_appointments,
		sum(case when SMS_received = 1 then 1 else 0 end) as sms_patients,
		cast(round(sum(case when SMS_received = 1 then 1 else 0 end) * 100.0 / count(*),2
					) as decimal(10,2)
			) as sms_coverage_rate
from health_mar
group by Waiting_group
order by sms_coverage_rate DESC;

--14. How many high-risk, long-waiting appointments are not covered by SMS reminders?
select Waiting_group, count(*) as total_appointments,
	sum(case when Show_up = 0 then 1 else 0 end) as no_show_count,
	sum(case when SMS_received = 0 then 1 else 0 end) as no_sms_count,
	sum(case when Show_up = 0 and SMS_received = 0 then 1 else 0 end) as no_show_without_sms
from health_mar
group by Waiting_group
order by no_show_without_sms DESC;

--15. Among patients who did not receive SMS, which waiting-time groups have the highest no-show risk?
select Waiting_group, 
		sum(case when SMS_received = 0 then 1 else 0 end) as no_sms_count,
		sum(case when Show_up = 0 and SMS_received = 0 then 1 else 0 end) as no_show_without_sms,
		cast(round(sum(case when Show_up = 0 and SMS_received = 0 then 1 else 0 end) * 100.0 /
						nullif(sum(case when SMS_received = 0 then 1 else 0 end),0	
								),2
					) as decimal(10,2) 
			) as no_show_rate_without_sms
from health_mar
group by Waiting_group
order by no_show_rate_without_sms DESC;

