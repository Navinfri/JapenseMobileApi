<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Role</title>
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
</style>
<body onload="getTeacher(); getPermission();">
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
			<div class="Container">
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">ROLE
					/ PERMISSION</h1>
				<div class="container2"
					style="padding-left: 20px; padding-right: 20px">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Select
							Teacher</label> <select id="teacher" name="teacher"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Teacher</option>
							<!-- <option>Permission</option>
							<option>Roles</option> -->
						</select>
					</div>
					<div></div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Select
							Permission</label> <select id="permission" name="permission"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Permission</option>
							<!-- <option>Permission</option>
							<option>Roles</option> -->
						</select>
					</div>
					<div></div>
				</div>
				<div
					style="display: flex; justify-content: center; margin-top: 30px">
					<button
						style="cursor: pointer; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none" id="saveButton">
						Save</button>
				</div>
			</div>
		</main>
	</section>
	<script type="text/javascript">
    function getTeacher() {
        $.ajax({
            type: "get",
            contentType: "application/json",
            url: 'getAllTeacher',
            async: false,
            success: function (response) {
                var appenddata1 = "";
                for (var i = 0; i < response.data.length; i++) {
                    appenddata1 += "<option value='" + response.data[i].firstName + " " + response.data[i].lastName + "'>" + response.data[i].firstName + " " + response.data[i].lastName + "</option>";
                }
                $("#teacher").append(appenddata1);
            },
            error: function () {
                alert("Device control failed");
            }
        });
    }
    
    function getPermission() {
        $.ajax({
            type: "get",
            contentType: "application/json",
            url: 'getRolesData',
            async: false,
            success: function (response) {
                if (response && Array.isArray(response) && response.length > 0) {
                    var appenddata1 = "";
                    for (var i = 0; i < response.length; i++) {
                        appenddata1 += "<option value='" + response[i].permissions + "'>" + response[i].permissions + "</option>";
                    }
                    $("#permission").append(appenddata1);
                } else {
                    alert("No data found or invalid response structure");
                }
            },
            error: function () {
                alert("Device control failed");
            }
        });
    }
	</script>
	<script>
	$(document).ready(function() {
	    $("#saveButton").click(function() {
	        var teacher = $("#teacher").val();
	        var permission = $("#permission").val();

	        var role = {
	            teacher: teacher,
	            permission: permission
	        };

	        $.ajax({
	            url: "saveTeacherRoleAndPermissson",
	            type: "POST",
	            contentType: "application/json",
	            data: JSON.stringify(role),
	            success: function(response) {
	                if (response && response.length > 0) {
	                    alert(response);
	                    window.location.href = "rolespermission";
	                } else {
	                    alert("Failed to save teacher role & permission");
	                }
	            },
	            error: function(error) {
	                alert("Failed to save teacher role & permission");
	            }
	        });
	    });
	});
	</script>
	<script src="js/adminscript.js"></script>
</body>
</html>