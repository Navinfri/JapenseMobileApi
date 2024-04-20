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
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main class="mainCont">
			<div>
				<h1 style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">CREATE
					ROLE</h1>
				<div class="container2">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 14px; font-weight: 500; margin-bottom: 7px">Select Teacher</label>
						<select id="" name="" style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
							<option>Permission</option>
							<option>Roles</option>
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 14px; font-weight: 500; margin-bottom: 7px">Select Course</label>
						<select id="" name="" style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
							<option>Permission</option>
							<option>Roles</option>
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 14px; font-weight: 500; margin-bottom: 7px">Select Batch</label>
						<select id="" name="" style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
							<option>Permission</option>
							<option>Roles</option>
						</select>
					</div>
					</div>
					<div style="margin-top: 30px;">
						<label style="font-size: 14px; font-weight: 500; margin-bottom: 25px">Select Permission</label>
						<div style="display: flex; justify-content: space-around; flex-wrap: wrap; margin-top: 20px;">
						<div>
							<input type="checkbox" style="width: 17px; height: 17px;" />
							<label style="font-size: 14px; font-weight: 500;">Category</label>
						</div>
						<div>
							<input type="checkbox" style="width: 17px; height: 17px;"/>
							<label style="font-size: 14px; font-weight: 500;">Question Type</label>
						</div>
						<div>
							<input type="checkbox" style="width: 17px; height: 17px;"/>
							<label style="font-size: 14px; font-weight: 500;">Study Material</label>
						</div>
						<div>
							<input type="checkbox" style="width: 17px; height: 17px;"/>
							<label style="font-size: 14px; font-weight: 500;">Add Question</label>
						</div>
					</div>
				</div>
				<div style="margin-top: 50px; display: flex; justify-content: center; gap: 50px;">
					<button
						style="cursor: pointer; font-weight: 700; font-size: 14px; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Save</button>
					<a href="managecreaterole">
						<button
							style="cursor: pointer; font-weight: 700; font-size: 14px; background-color: #12e068; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Manage</button>
					</a>
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