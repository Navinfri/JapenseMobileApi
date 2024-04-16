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
<body onload="getBatch(); getCourse();">
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div class="Container">
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">CREATE
					TEACHER</h1>
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
							<!-- <option>Permission</option>
							<option>Roles</option> -->
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Select
							Batch</label> <select id="batch" name="batch"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Batch</option>
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
						Save</button>
					<a href="manageteacher">
						<button
							style="cursor: pointer; background-color: #12e068; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Manage</button>
					</a>
				</div>
			</div>
		</main>
	</section>
	<script>
    $(document).ready(function() {
        $("#saveButton").click(function() {
            var firstName = $("#firstName").val();
            var lastName = $("#lastName").val();
            var courses = $("#courses").val();
            var batch = $("#batch").val();
            var emailId = $("#emailId").val();
            var password = $("#password").val();

            var teacher = {
                firstName: firstName,
                lastName: lastName,
                courses: courses,
                batch: batch,
                emailId: emailId,
                password: password
            };

            $.ajax({
                url: "saveTeacher",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(teacher),
                success: function(response) {
                    alert(response.message);
                    window.location.href = "addteacher";
                },
                error: function(error) {
                    alert("Failed to save teacher information");
                }
            });
        });
    });
	</script>
	<script type="text/javascript">
	function getBatch() {
		$.ajax({
			type: "get",
			contentType: "application/json",
			url: 'getAllBatchesData',
			asynch: false,
			success: function (data) {
				var appenddata1 = "";
				//var jsonData1 = JSON.parse(data1.d);
				for (var i = 0; i < data.length; i++) {
					appenddata1 += "<option value='" + data[i].batchName + "'>" + data[i].batchName + "</option>";
				}
				$("#batch").append(appenddata1);
			},
			error: function () {
				alert("Device control failed");
			}
		});
	}
	
	function getCourse() {
	    $.ajax({
	        type: "get",
	        contentType: "application/json",
	        url: 'course',
	        async: false,
	        success: function (response) {
	            var appenddata1 = "";
	            for (var i = 0; i < response.data.length; i++) {
	                appenddata1 += "<option value='" + response.data[i].courses + "'>" + response.data[i].courses + "</option>";
	            }
	            $("#courses").append(appenddata1);
	        },
	        error: function () {
	            alert("Device control failed");
	        }
	    });
	}
	</script>
	<script src="js/adminscript.js"></script>
</body>
</html>