SELECT * FROM bank_loan_data;

-- 1. Total loan application
SELECT COUNT(application_type) AS Total_loan_application
FROM bank_loan_data;

-- 2. MTD total loan application
SELECT COUNT(application_type) AS mtd_total_loan_application
FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- 3. PMTD total loan application
SELECT COUNT(application_type) AS pmtd_total_loan_application
FROM bank_loan_data
WHERE MONTH(issue_date) = 11;


-- 4. average dti
SELECT ROUND(AVG(dti), 2) AS avg_dti
FROM bank_loan_data;

-- 5. mtd average dti
SELECT ROUND(AVG(dti), 2) AS mtd_avg_dti
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 6. pmtd average dti
SELECT ROUND(AVG(dti), 2) AS pmtd_avg_dti
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 7. average interest rate
SELECT ROUND(AVG(int_rate), 2) AS avg_interest_rate
FROM bank_loan_data;

-- 8. mtd average interest rate
SELECT ROUND(AVG(int_rate), 2) AS mtd_avg_interest_rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 9. pmtd average interest rate
SELECT ROUND(AVG(int_rate), 2) AS pmtd_avg_interest_rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 10. total loan amount
SELECT SUM(loan_amount) AS total_loan_amount
FROM bank_loan_data;

--11. mtd total loan amount
SELECT SUM(loan_amount) AS mtd_total_loan_amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

--12. pmtd total loan amount
SELECT SUM(loan_amount) AS pmtd_total_loan_amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--13 total payment
SELECT SUM(total_payment) AS total_payment
FROM bank_loan_data;

--14 mtd total payment
SELECT SUM(total_payment) AS mtd_total_payment
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

--15 pmtd total payment
SELECT SUM(total_payment) AS pmtd_total_payment
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021; 

--16 monthly trends
SELECT DATEPART(MONTH, issue_date) AS month_number, DATENAME(MONTH, issue_date) AS month_name,
 COUNT(id) AS total_loan_applications,
SUM(loan_amount) AS total_loan_amount,
SUM(total_payment) AS total_payment
FROM bank_loan_data
GROUP BY DATEPART(MONTH, issue_date), DATENAME(MONTH, issue_date)
ORDER BY DATEPART(MONTH, issue_date);

-- 17 home ownership analysis
SELECT home_ownership,
COUNT(id) AS total_loan_applications,
SUM(total_payment) AS total_payment,
SUM(loan_amount) AS total_loan_amount,
ROUND((AVG(int_rate)*100), 2) AS avg_interest_rate,
ROUND((avg(dti)*100), 2) AS avg_dti
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;

-- 18 analysis by state
SELECT address_state AS state,
COUNT(id) AS total_loan_applications,
SUM(total_payment) AS total_payment,
SUM(loan_amount) AS total_loan_amount,
ROUND((AVG(int_rate)*100), 2) AS avg_interest_rate,
ROUND((avg(dti)*100), 2) AS avg_dti
FROM bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) DESC;

-- 19 employment length analysis
SELECT emp_length,
COUNT(id) AS total_loan_applications,
SUM(total_payment) AS total_payment,
SUM(loan_amount) AS total_loan_amount,
ROUND((AVG(int_rate)*100), 2) AS avg_interest_rate,
ROUND((avg(dti)*100), 2) AS avg_dti
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) DESC;

-- 20 purpose analysis
SELECT purpose,
COUNT(id) AS total_loan_applications,
SUM(total_payment) AS total_payment,
SUM(loan_amount) AS total_loan_amount,
ROUND((AVG(int_rate)*100), 2) AS avg_interest_rate,
ROUND((avg(dti)*100), 2) AS avg_dti
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC;

-- 21 term analysis
SELECT term,
COUNT(id) AS total_loan_applications,
SUM(total_payment) AS total_payment,
SUM(loan_amount) AS total_loan_amount,
ROUND((AVG(int_rate)*100), 2) AS avg_interest_rate,
ROUND((avg(dti)*100), 2) AS avg_dti
FROM bank_loan_data
GROUP BY term
ORDER BY term;

-- 22 Good loan Applications
SELECT COUNT(id) AS good_loan_applications
FROM bank_loan_data
WHERE loan_status IN ('Current', 'Fully Paid')

-- 23 percentage good loan application
SELECT COUNT(CASE WHEN loan_status IN ('Current','Fully Paid')
			THEN id END) * 100/COUNT(id) AS good_loans_percentage
FROM bank_loan_data

-- 24 percentage bad loan application
SELECT COUNT(CASE WHEN loan_status = 'Charged Off'
			THEN id END) * 100/COUNT(id) AS bad_loans_percentage
FROM bank_loan_data

-- 25 good loan total payment
SELECT SUM(total_payment) AS good_loan_total_payment
FROM bank_loan_data
WHERE loan_status IN ('Current', 'Fully Paid')

-- 26 bad loan total payment
SELECT SUM(total_payment) AS bad_loan_total_payment
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- 27 loan status grid view
SELECT loan_status, COUNT(id) as total_loans,
SUM(total_payment) AS total_payment,
SUM(loan_amount) AS total_loan_amount,
ROUND((AVG(int_rate)*100), 2) AS avg_interest_rate,
ROUND((avg(dti)*100), 2) AS avg_dti
FROM bank_loan_data
GROUP BY loan_status;

-- 28 mtd loan status based values
SELECT loan_status, COUNT(id) as mtd_total_loans,
SUM(total_payment) AS mtd_total_payment,
SUM(loan_amount) AS mtd_total_loan_amount,
ROUND((AVG(int_rate)*100), 2) AS mtd_avg_interest_rate,
ROUND((avg(dti)*100), 2) AS mtd_avg_dti
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status;



SELECT * FROM bank_loan_data;


