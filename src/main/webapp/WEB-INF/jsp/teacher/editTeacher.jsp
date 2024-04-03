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
<body onload="getBatch();">
	<section id="sidebar">
		<div class="brandHead">
			<a href="/" class="brand" style="color: rgb(16, 8, 92);"><img
				src="uploadfiles/logo2.png" style="width: 50px; margin-right: 10px;" />Admin</a>
		</div>
		<ul class="side-menu">
			<li><a href="#" style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-user icon"></i>Sub User <i
					class="fa-solid fa-caret-down icon-right"></i></a>
				<ul class="side-dropdown">
					<li><a href="userlist"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-list" style="margin-right: 15px"></i>User List</a></li>
					<li><a href="createroles"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-regular fa-user" style="margin-right: 15px"></i>Create
							Roles</a></li>
					<li><a href="createuser"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-user-plus" style="margin-right: 15px"></i>Create
							User</a></li>
				</ul></li>
			<li><a href="#" style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-clipboard-list icon"></i>Teacher <i
					class="fa-solid fa-caret-down icon-right"></i></a>
				<ul class="side-dropdown">
					<li><a href="addteacher"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-plus" style="margin-right: 15px"></i>Create
							Teacher</a></li>
					<li><a href="rolespermission"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-person" style="margin-right: 15px"></i>Role/Permission</a></li>
					<li><a href="attendanceofstudents"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-clipboard-user" style="margin-right: 15px"></i>Attendance
							of Students</a></li>
				</ul></li>
			<li><a href="#" style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-regular fa-user icon"></i>Student<i
					class="fa-solid fa-caret-down icon-right"></i></a>
				<ul class="side-dropdown">
					<li><a href="addstudents"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-person-circle-plus" style="margin-right: 15px"></i>Add
							Students</a></li>
				</ul></li>
			<li><a href="courses"
				style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-book" style="margin-left: 12px; font-size: 15px"></i><span
					style="margin-left: 30px">Courses</span></a></li>
			<li><a href="batches"
				style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-calendar-days"
					style="margin-left: 12px; font-size: 15px"></i><span
					style="margin-left: 30px">Batches</span></a></li>
			<li><a href="subscription"
				style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-cart-plus"
					style="margin-left: 12px; font-size: 15px"></i><span
					style="margin-left: 30px">Subscription</span></a></li>
			<li><a href="#" style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-user icon"></i>Study Material<i
					class="fa-solid fa-caret-down icon-right"></i></a>
				<ul class="side-dropdown">
					<li><a href="addcategory"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-plus" style="margin-right: 15px"></i>Add
							Category</a></li>
					<li><a href="studymaterial"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-book" style="margin-right: 15px"></i>Study
							Material</a></li>
					<li><a href="addmaterial"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-address-book" style="margin-right: 15px"></i>Add
							Material</a></li>
				</ul></li>
			<li><a href="#" style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-user icon"></i>Allotment to Study Material <i
					class="fa-solid fa-caret-down icon-right"></i></a>
				<ul class="side-dropdown">
					<li><a href="allot"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-regular fa-user" style="margin-right: 15px"></i>Add
							Allotment</a></li>
					<li><a href="addlist"
						style="color: rgb(16, 8, 92); font-weight: 500"><i
							class="fa-solid fa-list" style="margin-right: 15px"></i>Add List</a></li>
				</ul></li>
			<li><a href="attendance"
				style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-clipboard-user"
					style="margin-left: 12px; font-size: 15px"></i><span
					style="margin-left: 30px">Attendance of Students</span></a></li>
			<li><a href="enquiry"
				style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-phone"
					style="margin-left: 12px; font-size: 15px"></i><span
					style="margin-left: 30px">Enquiry</span></a></li>
			<li><a href="logs"
				style="color: rgb(16, 8, 92); font-weight: 500"><i
					class="fa-solid fa-database"
					style="margin-left: 12px; font-size: 15px"></i><span
					style="margin-left: 30px">Logs</span></a></li>
		</ul>
	</section>
	<section id="content">
		<nav class="navcont">
			<i class="fa-solid fa-bars toggle-sidebar"></i>
			<div class="subnav">
				<ul>
					<li><a href="#"><img src="uploadfiles/logo.png"
							style="width: 300px; margin-top: 10px;" /></a></li>
				</ul>
			</div>
			<div class="profile">
				<img src="uploadfiles/profile.jpg" class="profimg"
					alt="profile-photo">
				<div>
					<ul class="profile-link">
						<li
							style="text-transform: uppercase; font-size: 10.5px; margin-left: 10px; padding: .4rem; font-weight: 600;">
							Welcome!</li>
						<li><a href="#"><i
								class="fa-solid fa-person-running icon"></i>Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<main>
		<form action="" method="PUT">
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
							First Name</label> <input id="firstName" name="firstName" type="text" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Last Name</label> <input id="lastName" name="lastName" type="text" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Select
							Course</label> <select id="courses" name="courses"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Course</option>
							<option>Permission</option>
							<option>Roles</option>
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Select
							Batch</label> <select id="batch" name="batch"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option value="">Select Batch</option>
							<!-- <option>Permission</option>
							<option>Roles</option> -->
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Email Id</label> <input id="emailId" name="emailId" type="text" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Password</label> <input id="password" name="password" type="text" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
					<button
						style="cursor: pointer; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none" id="saveButton">
						Update</button>
				</div>
			</div>
		</main>
		</form>
	</section>
	<script type="text/javascript">
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
	                console.log("Response Data:", response);  // Log the entire response data
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
	        $("#courses").val(teacher.courses);
	        $("#emailId").val(teacher.emailId);
	        $("#password").val(teacher.password);
	        
	        // Fetch and populate batch dropdown
	        getBatch(function() {
	            $("#batch").val(teacher.batch);  // Set selected value after populating options
	        });
	    }

	    function getBatch(callback) {
	        $.ajax({
	            type: "get",
	            contentType: "application/json",
	            url: 'getAllBatchesData',
	            async: false,  // Changed 'asynch' to 'async'
	            success: function(data) {
	                var appenddata1 = "";
	                for (var i = 0; i < data.length; i++) {
	                    appenddata1 += "<option value='" + data[i].batchName + "'>" + data[i].batchName + "</option>";
	                }
	                $("#batch").append(appenddata1);
	                
	                if (typeof callback === "function") {
	                    callback();
	                }
	            },
	            error: function() {
	                alert("Device control failed");
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
	</script>
	<script src="js/adminscript.js"></script>
</body>
</html>