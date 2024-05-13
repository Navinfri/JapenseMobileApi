<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Batch</title>
<link rel="stylesheet" href="css/admin.css">
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<style>
.Container {
	width: 100%;
	height: 100vh;
}

.container2 {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-gap: 30px;
}

@media screen and (max-width: 1000px) {
	.container2 {
		grid-template-columns: 1fr;
	}
}

.container3 {
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-gap: 30px;
}

.TableContainer {
	margin-top: 20px;
	background: #fff;
	border-radius: 7px;
	border: 1.5px solid #e8e8e8;
	padding: 20px;
	cursor: pointer;
}

.MainTable {
	border-collapse: collapse;
	text-align: center;
	overflow: hidden;
	cursor: pointer;
	width: 500px;
	text-align: center;
}

.tableheading {
	border-bottom: 1px solid rgb(208, 208, 208);
	background-color: #36454f;
	text-align: center;
}

.tableheading th {
	padding: 1rem;
	text-transform: capitalize;
	letter-spacing: 0.1rem;
	font-size: 0.9rem;
	font-weight: 600;
	color: rgb(56, 56, 56);
}

.tablebody tr {
	font-weight: 500;
	font-size: 13.5px;
	text-align: center;
}

tbody tr:nth-child(even) {background: white}
tbody tr:nth-child(odd) {background: #0000000b}

</style>
<body>
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div>
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">ADD
					BATCH</h1>
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
					<!-- 					<div style="display: flex; flex-direction: column;"> -->
					<!-- 						<label style="font-size: 13px; margin-bottom: 7px">Enter -->
					<!-- 							Batch</label> <input id="" name="" type="text" required="required" -->
					<!-- 							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"> -->
					<!-- 					</div> -->
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Course</label> <select id="course" name="course"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
							<!-- 							<option>Permission</option> -->
							<!-- 							<option>Roles</option> -->
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
							Batch Name</label> <input id="batchName" name="batchName" type="text"
							required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
							Batch Demo Date</label>
						<div style="display: flex;">
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="day" id="day"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="month" id="month"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="year" id="year"></select>
							</div>
						</div>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
							Batch Start Date</label>
						<div style="display: flex;">
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="day1" id="day1"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="month1" id="month1"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="year1" id="year1"></select>
							</div>
						</div>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
							Batch End Date</label>
						<div style="display: flex;">
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="day2" id="day2"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="month2" id="month2"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="year2" id="year2"></select>
							</div>
						</div>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
							Assign Teacher Name</label> <input id="teacher" name="teacher"
							type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
							Batch Fee</label> <input id="batchFees" name="batchFees" type="text"
							required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
							Zoom Details</label>
						<textarea id="zoomDetails" name="zoomDetails" type="text"
							required="required"
							style="padding: 25px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
						
					</div>
					<!-- 					<div style="display: flex; flex-direction: column;"> -->
					<!-- 						<label style="font-size: 13px; margin-bottom: 7px">Add -->
					<!-- 							Students</label> <input id="" name="" type="text" required="required" -->
					<!-- 							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"> -->
					<!-- 					</div> -->
				</div>
				<div style="display: flex; flex-direction: column;">
					<label
						style="font-size: 14px; font-weight: 500; margin-left: 18px;">Select
						Classes Days</label>
					<div class="container3" style="padding-left: 15px">
					<div class="tablestyle">
					<table class="MainTable" id="batchTable">
						<thead class="tableheading">
							<tr>
								<th style="color: white">Days</th>
								<th style="color: white">Start Time</th>
								<th style="color: white">End Time</th>
							</tr>
						</thead>
						<tbody class="tablebody">
						    <tr>
								 <td><input type="checkbox" name="dayCheckbox" value="Sunday"> Sunday</td>
								<td><input id="sundayStartTime" name="sundayStartTime" type="time"
									style="padding: 13px; width: 100px; outline: none; border-radius: 5px; border: 1px solid #bfb8b8"></td>
								<td><input id="sundayEndTime" name="sundayEndTime" type="time"
									style="padding: 13px; width: 100px; border-radius: 5px; border: 1px solid #bfb8b8"></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="dayCheckbox" value="Monday">Monday</td>
								<td><input id="mondayStartTime" name="mondayStartTime" type="time"
									style="padding: 13px; width: 100px; outline: none; border-radius: 5px; border: 1px solid #bfb8b8"></td>
								<td><input id="mondayEndTime" name="mondaymondayEndTime" type="time"
									style="padding: 13px; width: 100px; border-radius: 5px; border: 1px solid #bfb8b8"></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="dayCheckbox" value="Tuesday">Tuesday</td>
								<td><input id="tuesdayStartTime" name="tuesdayStartTime" type="time"
									style="padding: 13px; width: 100px; outline: none; border-radius: 5px; border: 1px solid #bfb8b8"></td>
								<td><input id="tuesdayEndTime" name="tuesdayEndTime" type="time"
									style="padding: 13px; width: 100px; border-radius: 5px; border: 1px solid #bfb8b8"></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="dayCheckbox" value="Wednesday">Wednesday</td>
								<td><input id="wednesdayStartTime" name="StartTime" type="time"
									style="padding: 13px; width: 100px; outline: none; border-radius: 5px; border: 1px solid #bfb8b8"></td>
								<td><input id="wednesdayEndTime" name="wednesdayEndTime" type="time"
									style="padding: 13px; width: 100px; border-radius: 5px; border: 1px solid #bfb8b8"></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="dayCheckbox" value="Thursday">Thursday</td>
								<td><input id="thursdayStartTime" name="thursdayStartTime" type="time"
									style="padding: 13px; width: 100px; outline: none; border-radius: 5px; border: 1px solid #bfb8b8"></td>
								<td><input id="thursdayEndTime" name="thursdayEndTime" type="time"
									style="padding: 13px; width: 100px; border-radius: 5px; border: 1px solid #bfb8b8"></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="dayCheckbox" value="Friday">Friday</td>
								<td><input id="fridayStartTime" name="fridayStartTime" type="time"
									style="padding: 13px; width: 100px; outline: none; border-radius: 5px; border: 1px solid #bfb8b8"></td>
								<td><input id="fridayEndTime" name="fridayEndTime" type="time"
									style="padding: 13px; width: 100px; border-radius: 5px; border: 1px solid #bfb8b8"></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="dayCheckbox" value="Saturday">Saturday</td>
								<td><input id="saturdayStartTime" name="saturdayStartTime" type="time"
									style="padding: 13px; width: 100px; outline: none; border-radius: 5px; border: 1px solid #bfb8b8"></td>
								<td><input id="saturdayEndTime" name="saturdayEndTime" type="time"
									style="padding: 13px; width: 100px; border-radius: 5px; border: 1px solid #bfb8b8"></td>
							</tr>
						</tbody>
					</table>
					</div>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
					<button
						style="cursor: pointer; font-weight: 700; font-size: 14px; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none"
						id="saveButton">Add</button>
					<a href="managebatch">
						<button
							style="cursor: pointer; font-weight: 700; font-size: 14px; background-color: #12e068; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Manage</button>
					</a>
				</div>
				<br>
			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
	<script>
	
	function getDate(dayId, monthId, yearId) {
	    const day = $("#" + dayId).val();
	    const month = $("#" + monthId).val();
	    const year = $("#" + yearId).val();
	    return year + "-" + month + "-" + day;
	}

	
	$(document).ready(function() {
	    // Click event handler for the save button
	    $("#saveButton").click(function() {
	        const course = $("#course").val();
	        const batchName = $("#batchName").val();

	        const batchDemoDate = getDate("day", "month", "year");
	        const batchStartDate = getDate("day1", "month1", "year1");
	        const batchEndDate = getDate("day2", "month2", "year2");
	        
	        const teacher = $("#teacher").val();
	        const batchFees = $("#batchFees").val();
	        const zoomDetails = $("#zoomDetails").val();

	        var classesData = []; // Initialize an empty array to store the data

	        $("input[name='dayCheckbox']").each(function() {
	            var day = $(this).val();
	            var startTime = $("#" + day.toLowerCase() + "StartTime").val();
	            var endTime = $("#" + day.toLowerCase() + "EndTime").val();

	            // Check if the checkbox is checked before pushing data into the array
	            if ($(this).is(":checked")) {
	                classesData.push({
	                    day: day,
	                    startTime: startTime,
	                    endTime: endTime
	                });
	            }
	        });

	        // Construct batch data object
	        const batchData = {
	            course: course,
	            batchName: batchName,
	            batchDemoDate: batchDemoDate,
	            batchStartDate: batchStartDate,
	            batchEndDate: batchEndDate,
	            teacher: teacher,
	            batchFees: batchFees,
	            zoomDetails: zoomDetails,
	            classesDay: JSON.stringify(classesData)
	        };

	        // Send AJAX request to save batch data
	        $.ajax({
	            url: "/JapaneseAdminWebApp/saveBatches",
	            type: "POST",
	            contentType: "application/json",
	            data: JSON.stringify(batchData),
	            success: function(response) {
	                alert(response);
	                window.location.href = "batches";
	            },
	            error: function(jqXHR, status, errorThrown) {
	                if (jqXHR.status === 403) {
	                    alert("YOU DON'T HAVE THE PERMISSION");
	                } else {
	                    alert("Failed to communicate with the server");
	                }
	            }
	        });
	    });
	});
	    // Function to asynchronously fetch course data
	    function getCourseData() {
        $.ajax({
            type: "GET",
            url: '/JapaneseAdminWebApp/course',
            dataType: 'json', 
            success: function(response) {
                var appenddata1 = "";
                for (var i = 0; i < response.data.length; i++) {
                    appenddata1 += "<option value='" + response.data[i].courses + "'>" + response.data[i].courses + "</option>";
                }
                $("#course").append(appenddata1);
            },
            error: function (jqXHR, status, errorThrown) {
                if (jqXHR.status === 403) {
                    alert("YOU DON'T HAVE THE PERMISSION");
                } else {
                    alert("Failed to communicate with the server");
                }
            }
        });
    }

    // Call the function after its declaration
    $(document).ready(function() {
        getCourseData();
    });

	</script>

	<!--date format code  -->
	<script>
    const yearSelect = document.getElementById("year");
    const monthSelect = document.getElementById("month");
    const daySelect = document.getElementById("day");

    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    (function populateMonths() {
        for (let i = 0; i < months.length; i++) {
            const option = document.createElement('option');
            option.textContent = months[i];
            monthSelect.appendChild(option);
        }
        monthSelect.value = "January";
    })();

    function populateDays(month) {
        while (daySelect.firstChild) {
            daySelect.removeChild(daySelect.firstChild);
        }

        let dayNum;

        if (month === 'January' || month === 'March' || month === 'May'
            || month === 'July' || month === 'August'
            || month === 'October' || month === 'December') {
            dayNum = 31;
        } else if (month === 'April' || month === 'June'
            || month === 'September' || month === 'November') {
            dayNum = 30;
        }

        for (let i = 1; i <= dayNum; i++) {
            const option = document.createElement("option");
            option.textContent = i;
            daySelect.appendChild(option);
        }
    }

    function populateYears() {
        let year = new Date().getFullYear();
        for (let i = 0; i < 101; i++) {
            const option = document.createElement("option");
            option.textContent = year - i;
            yearSelect.appendChild(option);
        }
    }

    populateDays(monthSelect.value);
    populateYears();
</script>

<script>
    const yearSelect1 = document.getElementById("year1");
    const monthSelect1 = document.getElementById("month1");
    const daySelect1 = document.getElementById("day1");

    const months1 = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    (function populateMonths1() {
        for (let i = 0; i < months1.length; i++) {
            const option = document.createElement('option');
            option.textContent = months1[i]; // Corrected variable name
            monthSelect1.appendChild(option);
        }
        monthSelect1.value = "January";
    })();

    function populateDays1(month1) {
        while (daySelect1.firstChild) {
            daySelect1.removeChild(daySelect1.firstChild);
        }

        let dayNum1;

        if (month1 === 'January' || month1 === 'March' || month1 === 'May'
            || month1 === 'July' || month1 === 'August'
            || month1 === 'October' || month1 === 'December') {
            dayNum1 = 31;
        } else if (month1 === 'April' || month1 === 'June'
            || month1 === 'September' || month1 === 'November') {
            dayNum1 = 30;
        }

        for (let i = 1; i <= dayNum1; i++) {
            const option = document.createElement("option");
            option.textContent = i;
            daySelect1.appendChild(option);
        }
    }

    function populateYears1() {
        let year1 = new Date().getFullYear();
        for (let i = 0; i < 101; i++) {
            const option = document.createElement("option");
            option.textContent = year1 - i;
            yearSelect1.appendChild(option);
        }
    }

    populateDays1(monthSelect1.value);
    populateYears1();
</script>

<script>
    const yearSelect2 = document.getElementById("year2");
    const monthSelect2 = document.getElementById("month2");
    const daySelect2 = document.getElementById("day2");

    const months2 = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    (function populateMonths2() {
        for (let i = 0; i < months2.length; i++) {
            const option = document.createElement('option');
            option.textContent = months2[i]; // Corrected variable name
            monthSelect2.appendChild(option);
        }
        monthSelect2.value = "January"; // Corrected variable name
    })();

    function populateDays2(month2) {
        while (daySelect2.firstChild) {
            daySelect2.removeChild(daySelect2.firstChild);
        }

        let dayNum2;

        if (month2 === 'January' || month2 === 'March' || month2 === 'May'
            || month2 === 'July' || month2 === 'August'
            || month2 === 'October' || month2 === 'December') {
            dayNum2 = 31;
        } else if (month2 === 'April' || month2 === 'June'
            || month2 === 'September' || month2 === 'November') {
            dayNum2 = 30;
        }

        for (let i = 1; i <= dayNum2; i++) {
            const option = document.createElement("option");
            option.textContent = i;
            daySelect2.appendChild(option);
        }
    }

    function populateYears2() {
        let year2 = new Date().getFullYear();
        for (let i = 0; i < 101; i++) {
            const option = document.createElement("option");
            option.textContent = year2 - i;
            yearSelect2.appendChild(option);
        }
    }

    populateDays2(monthSelect2.value);
    populateYears2();
</script>


	
	<script>
function toggleRequired(checkbox, startTimeInput, endTimeInput) {
    if (checkbox.checked) {
        startTimeInput.required = true;
        endTimeInput.required = true;
    } else {
        startTimeInput.required = false;
        endTimeInput.required = false;
    }
}
</script>
</body>
</html>
