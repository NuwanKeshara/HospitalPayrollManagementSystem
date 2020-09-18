DELIMITER $$
CREATE EVENT `backup_paysheets` 
ON SCHEDULE EVERY 1 MONTH
STARTS '2020-09-20 00:00:00'
ENDS '2030-09-20 00:00:00'
DO 
BEGIN

    INSERT INTO paysheets_backup(id, date, status, name , designation , basicSalary , overtime ,medical , bonus , other , deductionDescription , deductionTotal , totalEarnings , netpay)
	SELECT id, date, 'doctor' , name , designation , basicSalary , overtime ,medical , bonus , other , deductionDescription , deductionTotal , totalEarnings , netPay 
    FROM  payroll_management.doctor_monthly_payslip;
    
    INSERT INTO paysheets_backup(id, date, status, name , designation , basicSalary , overtime ,medical , bonus , other , deductionDescription , deductionTotal , totalEarnings , netpay)
	SELECT id, date, 'nurse' , name , designation , basicSalary , overtime ,medical , bonus , other , deductionDescription , deductionTotal , totalEarnings , netpay
	FROM payroll_management.nurse_monthly_payslip;
    
    INSERT INTO paysheets_backup(id, date, status, name , designation , basicSalary , overtime ,medical , bonus , other , deductionDescription , deductionTotal , totalEarnings , netpay)
	SELECT id, date, 'staff' , name , designation , basicSalary , overtime ,medical , bonus , other , deductionDescription , deductionTotal , totalEarnings , netpay
	FROM staff_monthly_payslip;
    
    DELETE FROM doctor_monthly_payslip;
    DELETE FROM nurse_monthly_payslip;
    DELETE FROM staff_monthly_payslip;
END$$

DELIMITER ;


SELECT * FROM payroll_management.paysheets_backup;

show PROCESSLIST;
set GLOBAL event_scheduler = OFF;

SHOW EVENTS

DROP EVENT `backup_paysheets`;

ALTER EVENT `backup_paysheets` DISABLE;