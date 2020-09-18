<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Payroll Management</title>
</head>
<body>
	<center>
		<h1>Payroll Management</h1>
	</center>
    <div align="center">
		
	<form action="DoctorPayrollRegisterServlet" method="post">
        
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		Doctor PaySlip
            	</h2>
            </caption>
        		            
            <tr>
                <th>ID: </th>
                <td>
                	<input type="text" name="id" size="45"
                			value=""
                		/>
                </td>
            </tr>
            <tr>
                <th>Name: </th>
                <td>
                	<input type="text" name="name" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Designation: </th>
                <td>
                	<input type="text" name="designation" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Basic Salary: </th>
                <td>
                	<input type="text" name="basicSalary" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Overtime: </th>
                <td>
                	<input type="text" name="overtime" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Medical: </th>
                <td>
                	<input type="text" name="medical" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Bonus: </th>
                <td>
                	<input type="text" name="bonus" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Other: </th>
                <td>
                	<input type="text" name="other" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Deduction Description: </th>
                <td>
                	<input type="text" name="deductionDescription" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Deduction Total: </th>
                <td>
                	<input type="text" name="deductionTotal" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Total Earnings: </th>
                <td>
                	<input type="text" name="TotalEarnings" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
                <th>Net Salary: </th>
                <td>
                	<input type="text" name="netPay" size="45"
                			value=""
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" />
            	</td>
            </tr>
        </table>
        </form>
    </div>	
</body>
</html>