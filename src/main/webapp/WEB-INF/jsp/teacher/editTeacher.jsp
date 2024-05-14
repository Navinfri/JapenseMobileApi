<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Teacher</title>
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
	grid-gap: 20px;
}

@media screen and (max-width: 1000px) {
	.container2 {
		grid-template-columns: 1fr;
	}
}
</style>
<body>
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<form id="updateTeacherForm" method="PUT">
				<div class="Container">
					<h1
						style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">UPDATE
						TEACHER</h1>
					<input type="hidden" id="id" name="id"> 
					<input type="hidden" id="date" name="date"> 
					<input type="hidden" id="uniqueId" name="uniqueId">
					<div class="container2"
						style="padding-left: 20px; padding-right: 20px">
						<div style="display: flex; flex-direction: column;">
							<label style="font-size: 13px; margin-bottom: 7px">Enter
								First Name</label> <input id="firstName" name="firstName" type="text"
								required="required"
								style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
						</div>
						<div style="display: flex; flex-direction: column;">
							<label style="font-size: 13px; margin-bottom: 7px">Enter
								Last Name</label> <input id="lastName" name="lastName" type="text"
								required="required"
								style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
						</div>
						<div style="display: flex; flex-direction: column;">
							<label style="font-size: 13px; margin-bottom: 7px">Select
								Gender</label> <select id="gender" name="gender"
								style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
								<option>Select Gender</option>
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div>
						<div style="display: flex; flex-direction: column;">
							<label style="font-size: 13px; margin-bottom: 7px">Enter
								Email Id</label> <input id="emailId" name="emailId" type="text"
								required="required" readonly="readonly"
								style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
						</div>
						<div style="display: flex; flex-direction: column;">
							<label style="font-size: 13px; margin-bottom: 7px">Enter
								Password</label> <input id="password" name="password" type="text"
								required="required" readonly="readonly"
								style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
						</div>
						<!-- <div style="display: flex; flex-direction: column;">
							<label
								style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
								Course</label> <select id="courses" name="courses[]" multiple
								style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
								Options will be populated dynamically
							</select>
						</div>
						<div style="display: flex; flex-direction: column;">
							<label
								style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
								Batch</label> <select id="batch" name="batch[]" multiple
								style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
								Options will be populated dynamically
							</select>
						</div> -->
					</div>
					<div
						style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
						<button
							style="cursor: pointer; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none"
							id="saveButton">Update</button>
						<a href="manageteacher"> <!-- <button
							style="cursor: pointer; background-color: #12e068; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Manage</button> -->
						</a>
					</div>
				</div>
			</form>
		</main>
	</section>
	<!-- <script type="text/javascript">
	$(document).ready(function() {
	    var teacherId = getUrlParameter('id');

	    if (teacherId) {
	        getTeacherDetails(teacherId);
	    } else {
	        alert("Teacher ID is missing");
	    }

	    function getTeacherDetails(id) {
	        $.ajax({
	            url: "teacher/" + id,
	            type: "GET",
	            contentType: "application/json",
	            success: function(response) {
	                console.log("Response Data:", response);
	                if (response.status === "SUCCESS") {
	                    populateForm(response.data);
	                } else {
	                    alert(response.message);
	                }
	            },
	            error: function(error) {
	                alert("Failed to fetch teacher data");
	            }
	        });
	    }

	    function populateForm(teacher) {
	        $("#id").val(teacher.id);
	        $("#date").val(teacher.date);
	        $("#uniqueId").val(teacher.uniqueId);
	        $("#firstName").val(teacher.firstName);
	        $("#lastName").val(teacher.lastName);
	        $("#emailId").val(teacher.emailId);
	        $("#password").val(teacher.password);
	        $("#gender").val(teacher.gender);

	        // Parse courses and batches JSON strings into JavaScript arrays
	        var courses = JSON.parse(teacher.courses);
	        var batchName = JSON.parse(teacher.batchName);

	        // Populate course dropdown
	        var courseDropdown = $("#courses");
	        courseDropdown.empty(); // Clear existing options
	        $.each(courses, function(index, course) {
	            courseDropdown.append($("<option></option>")
	                .attr("value", course)
	                .text(course));
	        });

	        // Populate batch dropdown
	        var batchDropdown = $("#batch");
	        batchDropdown.empty(); // Clear existing options
	        $.each(batchName, function(index, batch) {
	            batchDropdown.append($("<option></option>")
	                .attr("value", batch)
	                .text(batch));
	        });
	    }

	    function getBatch(selectedBatch, callback) {
	        $.ajax({
	            type: "get",
	            contentType: "application/json",
	            url: 'getAllBatchesData',
	            success: function(data) {
	                var appenddata1 = "";
	                for (var i = 0; i < data.length; i++) {
	                    appenddata1 += "<option value='" + data[i].batchName + "'>" + data[i].batchName + "</option>";
	                }
	                $("#batch").html(appenddata1);
	                $("#batch").val(selectedBatch); // Set selected value
	                if (typeof callback === "function") {
	                    callback();
	                }
	            },
	            error: function() {
	                alert("Failed to fetch batches");
	            }
	        });
	    }

	    function getCourse(selectedCourse, callback) {
	        $.ajax({
	            type: "get",
	            contentType: "application/json",
	            url: 'course',
	            success: function(response) {
	                var appenddata1 = "";
	                for (var i = 0; i < response.data.length; i++) {
	                    appenddata1 += "<option value='" + response.data[i].courses + "'>" + response.data[i].courses + "</option>";
	                }
	                $("#courses").html(appenddata1);
	                $("#courses").val(selectedCourse); // Set selected value
	                if (typeof callback === "function") {
	                    callback();
	                }
	            },
	            error: function() {
	                alert("Failed to fetch courses");
	            }
	        });
	    }

	    $("#saveButton").click(function(event) {
	        event.preventDefault();
	        var teacherData = {
	            id: $("#id").val(),
	            date: $("#date").val(),
	            uniqueId: $("#uniqueId").val(),
	            firstName: $("#firstName").val(),
	            lastName: $("#lastName").val(),
	            gender: $("#gender").val(),
	            courses: $("#courses").val(),
	            batch: $("#batch").val(),
	            emailId: $("#emailId").val(),
	            password: $("#password").val()
	        };

	        updateTeacher(teacherData);
	    });

	    function updateTeacher(data) {
	        $.ajax({
	            url: "updateTeacher/" + data.id,
	            type: "PUT",
	            contentType: "application/json",
	            data: JSON.stringify(data),
	            success: function(response) {
	                if (response.status === "SUCCESS") {
	                    alert(response.message);
	                    window.location.href = "manageteacher"; // Redirect to the correct URL
	                } else {
	                    alert(response.message);
	                }
	            },
	            error: function(error) {
	                alert("Failed to update teacher information");
	            }
	        });
	    }

	    function getUrlParameter(name) {
	        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
	        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
	        var results = regex.exec(location.search);
	        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
	    }
	});
    </script> -->
    <script type="text/javascript">
    $(document).ready(function() {
        var teacherId = getUrlParameter('id');

        if (!teacherId) {
            alert("Teacher ID is missing");
            return;
        }

        getTeacherDetails(teacherId);

        function getTeacherDetails(id) {
            $.ajax({
                url: "/JapaneseAdminWebApp/teacher/" + id,
                type: "GET",
                contentType: "application/json",
                success: function(response) {
                    console.log("Response Data:", response);
                    if (response.status === "SUCCESS") {
                        populateForm(response.data);
                    } else {
                        alert(response.message);
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    var response = jqXHR.responseJSON; // Parse JSON response
                    if (response && response.message) {
                        alert(response.message);
                    } else {
                        alert("Failed to fetch teacher data. Please try again later.");
                    }
                }
            });
        }

        function populateForm(teacher) {
            $("#id").val(teacher.id);
            $("#date").val(teacher.date);
            $("#uniqueId").val(teacher.uniqueId);
            $("#firstName").val(teacher.firstName);
            $("#lastName").val(teacher.lastName);
            $("#emailId").val(teacher.emailId);
            $("#password").val(teacher.password);
            $("#gender").val(teacher.gender);
        }

        // Event listener for form submission
        $('#updateTeacherForm').submit(function(event) {
            // Prevent the default form submission
            event.preventDefault();
            
            // Serialize form data into JSON format
            var formData = {
                id: $("#id").val(),
                firstName: $("#firstName").val(),
                lastName: $("#lastName").val(),
                gender: $("#gender").val(),
                emailId: $("#emailId").val(),
                password: $("#password").val(),
                uniqueId: $("#uniqueId").val()
            };
            
            // Send AJAX PUT request to update the teacher data
            $.ajax({
                type: "PUT",
                url: "/JapaneseAdminWebApp/updateTeacherDataInBothTable/" + formData.id,
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function(response) {
                    // Handle success response
                    if (response && response.message) {
                        alert(response.message);
                    } else {
                        alert("Teacher updated successfully");
                    }
                    // Redirect to the correct URL
                    window.location.href = "manageteacher";
                },
                error: function(xhr, textStatus, errorThrown) {
                    // Handle error response
                    if (xhr && xhr.responseJSON && xhr.responseJSON.message) {
                        alert(xhr.responseJSON.message);
                    } else {
                        alert("Failed to update teacher: " + errorThrown);
                    }
                }
            });
        });

        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        }
    });
	</script>
	<script src="js/adminscript.js"></script>
</body>