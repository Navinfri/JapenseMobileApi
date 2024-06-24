<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>View Batch</title>
        <link rel="stylesheet" href="css/admin.css">
        <script src="https://kit.fontawesome.com/ae73087723.js" crossorigin="anonymous"></script>
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
            text-align: left;
        }

        tbody tr:nth-child(even) {
            background: white
        }

        tbody tr:nth-child(odd) {
            background: #0000000b
        }
        input[name="dayCheckbox"] {
        display: none;
    }
    </style>

    <body>
        <jsp:include page="../sidenav.jsp"></jsp:include>
        <section id="content">
            <jsp:include page="../header.jsp"></jsp:include>
            <main>
                <div>
                    <h1 style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">VIEW
                        BATCH</h1>
                    <div class="container2" style="margin-left: 20px; margin-right: 20px">
                        <!-- 					<div style="display: flex; flex-direction: column;"> -->
                        <!-- 						<label style="font-size: 13px; margin-bottom: 7px">Enter -->
                        <!-- 							Batch</label> <input id="" name="" type="text" required="required" -->
                        <!-- 							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"> -->
                        <!-- 					</div> -->
                        <input type="hidden" id="id" name="id">
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 900;">
                                Course</label> <label id="course" name="course"
                                style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8">
                                
                                <!-- 							<option>Permission</option> -->
                                <!-- 							<option>Roles</option> -->
                            </label>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 900;">
                                Batch Name</label> <label id="batchName" name="batchName" type="text"
                                required="required"
                                style="padding: 16px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"></label>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">Enter
                                Batch Demo Date</label>
                            <div style="display: flex;">
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="day" id="day"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="month" id="month"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="year" id="year"></label>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">Enter
                                Batch Start Date</label>
                            <div style="display: flex;">
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="day1" id="day1"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="month1" id="month1"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="year1" id="year1"></label>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">Enter
                                Batch End Date</label>
                            <div style="display: flex;">
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="day2" id="day2"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="month2" id="month2"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="year2" id="year2"></label>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">Enter
                                Assign Teacher Name</label> <label id="teacher" name="teacher" type="text"
                                required="required"
                                style="padding: 16px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"></label>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">Enter
                                Batch Fee</label> <label id="batchFees" name="batchFees" type="text" required="required"
                                style="padding: 16px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"></label>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">Enter
                                Zoom Details</label>
                            <label id="zoomDetails" name="zoomDetails" type="text" rows="7" required="required"
                                style="padding: 16px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"></label>
                            .
                        </div>
                        <!-- 					<div style="display: flex; flex-direction: column;"> -->
                        <!-- 						<label style="font-size: 13px; margin-bottom: 7px">Add -->
                        <!-- 							Students</label> <input id="" name="" type="text" required="required" -->
                        <!-- 							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"> -->
                        <!-- 					</div> -->
                    </div>
                    <div style="display: flex; flex-direction: column;">
                        <label style="font-size: 14px; font-weight: 900;margin-left: 18px;">Select
                            Classes Days</label>
                        <div class="container3" style="padding-left: 15px ">
                            <div class="tablestyle">
                                <table class="MainTable" id="batchTable">
                                    <thead class="tableheading">
                                        <tr>
                                            <th style="color: white">Days</th>
                                            <th style="color: white">Start Time</th>
                                            <th style="color: white">End Time</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tablebody" id="batchTableBody">
                                        <tr>
                                            <td><input type="checkbox" name="dayCheckbox" value="Sunday"> Sunday</td>
                                            <td><label id="sundayStartTime" name="sundayStartTime" type="time"
                                                    style="padding: 13px; width: 100px; outline: none; border-radius: 5px;"></label>
                                            </td>
                                            <td><label id="sundayEndTime" name="sundayEndTime" type="time"
                                                    style="padding: 13px; width: 100px; outline: none; border-radius: 5px;"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="dayCheckbox" value="Monday">Monday</td>
                                            <td><label id="mondayStartTime" name="mondayStartTime" type="time"
                                                    style="padding: 13px; width: 100px; outline: none; border-radius: 5px;"></label>
                                            </td>
                                            <td><label id="mondayEndTime" name="mondaymondayEndTime" type="time"
                                                    style="padding: 13px; width: 100px; outline: none; border-radius: 5px;"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="dayCheckbox" value="Tuesday">Tuesday</td>
                                            <td><label id="tuesdayStartTime" name="tuesdayStartTime" type="time"
                                                    style="padding: 13px; width: 100px; outline: none; border-radius: 5px;"></label>
                                            </td>
                                            <td><label id="tuesdayEndTime" name="tuesdayEndTime" type="time"
                                                    style="padding: 13px; width: 100px; outline: none; border-radius: 5px;"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="dayCheckbox" value="Wednesday">Wednesday
                                            </td>
                                            <td><label id="wednesdayStartTime" name="StartTime" type="time"
                                                    style="padding: 13px; width: 100px; border-radius: 5px;"></label>
                                            </td>
                                            <td><label id="wednesdayEndTime" name="wednesdayEndTime" type="time"
                                                    style="padding: 13px; width: 100px; border-radius: 5px;"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="dayCheckbox" value="Thursday">Thursday</td>
                                            <td><label id="thursdayStartTime" name="thursdayStartTime" type="time"
                                                    style="padding: 13px; width: 100px; border-radius: 5px;"></label>
                                            </td>
                                            <td><label id="thursdayEndTime" name="thursdayEndTime" type="time"
                                                    style="padding: 13px; width: 100px; border-radius: 5px;"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="dayCheckbox" value="Friday">Friday</td>
                                            <td><label id="fridayStartTime" name="fridayStartTime" type="time"
                                                    style="padding: 13px; width: 100px; border-radius: 5px;"></label>
                                            </td>
                                            <td><label id="fridayEndTime" name="fridayEndTime" type="time"
                                                    style="padding: 13px; width: 100px; border-radius: 5px;"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox" name="dayCheckbox" value="Saturday">Saturday</td>
                                            <td><label id="saturdayStartTime" name="saturdayStartTime" type="time"
                                                    style="padding: 13px; width: 100px; border-radius: 5px;"></label>
                                            </td>
                                            <td><label id="saturdayEndTime" name="saturdayEndTime" type="time"
                                                    style="padding: 13px; width: 100px; border-radius: 5px;"></label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </section>
        <script src="js/adminscript.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var batchId = getUrlParameter('id');

                if (batchId) {
                    getBatchDetails(batchId);
                } else {
                    alert("Batch ID is missing");
                }

                function getBatchDetails(id) {
                    $.ajax({
                        url: "/JapaneseAdminWebApp/getBatchesDataById/" + id,
                        type: "POST",
                        contentType: "application/json",
                        success: function (response) {
                            //console.log("Response Data:", response);
                            if (response) {
                                populateForm(response);

                            } else {
                                alert("No batch data found");
                            }
                        },
                        error: function(jqXHR, status, errorThrown) {
        	                if (jqXHR.status === 403) {
        	                    alert("YOU DON'T HAVE THE PERMISSION");
        	                } else {
        	                    alert("Failed to communicate with the server");
        	                }
                        }
                    });
                }

                function populateForm(batch) {
                    console.log("Batch Data:", batch); // Check if all fields are present in the batch object
                    document.getElementById("id").innerText = batch.id;
                    document.getElementById("course").innerText = batch.course;
                    document.getElementById("batchName").innerText = batch.batchName;
                    $("#batchDemoDate").val(batch.batchDemoDate);
                    $("#batchStartDate").val(batch.batchStartDate);
                    $("#batchEndDate").val(batch.batchEndDate);
                    $("#classesDay").val(batch.classesDay);
                    document.getElementById("teacher").innerText = batch.teacher;
                    document.getElementById("batchFees").innerText = batch.batchFees;
                    document.getElementById("zoomDetails").innerText = batch.zoomDetails;

                    // Call displayDates function to set the date dropdown values
                    displayDates(batch.batchDemoDate, batch.batchStartDate, batch.batchEndDate);

                    populateClassesDaysTable(batch.classesDay);
                    // Parse and pass the correct classesDay data to populateClassesDaysTable function
                }



                function displayDates(batchDemoDate, batchStartDate, batchEndDate) {
                    // Split the date strings into day, month, and year
                    var demoDateParts = batchDemoDate.split("-");
                    var startDateParts = batchStartDate.split("-");
                    var endDateParts = batchEndDate.split("-");

                    // Set the selected options for demo date
                    document.getElementById("day").innerText = demoDateParts[2];
                    document.getElementById("month").innerText = demoDateParts[1];
                    document.getElementById("year").innerText = demoDateParts[0];

                    // Set the text content for start date
                    document.getElementById("day1").innerText = startDateParts[2];
                    document.getElementById("month1").innerText = startDateParts[1];
                    document.getElementById("year1").innerText = startDateParts[0];

                    // Set the text content for end date
                    document.getElementById("day2").innerText = endDateParts[2];
                    document.getElementById("month2").innerText = endDateParts[1];
                    document.getElementById("year2").innerText = endDateParts[0];
                }

                function populateClassesDaysTable(classesDay) {
                    // Parse the JSON string into a JavaScript array
                    classesDay = JSON.parse(classesDay);

                    // Check if classesDay is an array
                    if (Array.isArray(classesDay)) {
                        // Iterate over each entry in the classesDay array
                        classesDay.forEach(function (dayData) {
                            var day = dayData.day;
                            var startTime = dayData.startTime;
                            var endTime = dayData.endTime;

                            // Find the corresponding checkbox and label elements and set their values
                            var checkbox = $('input[value="' + day + '"]');
                            checkbox.prop('checked', true); // Check the checkbox for the day

                            // Ensure the IDs for start and end time labels are correctly formatted
                            var startTimeLabel = $('#' + day.toLowerCase() + 'StartTime');
                            startTimeLabel.text(startTime); // Set text content for label

                            var endTimeLabel = $('#' + day.toLowerCase() + 'EndTime');
                            endTimeLabel.text(endTime); // Set text content for label
                        });
                    } else {
                        console.error("classesDay is not an array.");
                    }
                }



                function getUrlParameter(name) {
                    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                    var results = regex.exec(location.search);
                    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
                }
            });


        </script>

        
    </body>

    </html>