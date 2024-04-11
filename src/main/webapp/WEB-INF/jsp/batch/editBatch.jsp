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
</style>
<body>
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
                    <li><a href="#"><img src="uploadfiles/logo.png" style="width: 300px; margin-top: 10px;" /></a></li>
                </ul>
            </div>

            <div class="profile">
                <img src="uploadfiles/profile.jpg" class="profimg" alt="profile-photo">
                <div>
                    <ul class="profile-link">
                        <li
                            style="text-transform: uppercase; font-size: 10.5px; margin-left: 10px; padding: .4rem; font-weight: 600;">
                            Welcome!</li>
                        <li><a href="#"><i class="fa-solid fa-person-running icon"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
		<main>
			<div>
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">UPDATE
					BATCH</h1>
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
<!-- 					<div style="display: flex; flex-direction: column;"> -->
<!-- 						<label style="font-size: 13px; margin-bottom: 7px">Enter -->
<!-- 							Batch</label> <input id="" name="" type="text" required="required" -->
<!-- 							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"> -->
<!-- 					</div> -->
<input type="hidden" id="id" name="id">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Select
							Course</label> <select id="course" name="course"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
<!-- 							<option>Permission</option> -->
<!-- 							<option>Roles</option> -->
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Batch Name</label> <input id="batchName" name="batchName" type="text" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Batch Demo Date</label> <input id="batchDemoDate" name="batchDemoDate" type="date" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Batch Start Date</label> <input id="batchStartDate" name="batchStartDate" type="date" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Batch End Date</label> <input id="batchEndDate" name="batchEndDate" type="date" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Classes Days</label> <input id="classesDay" name="classesDay" type="text" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Assign Teacher Name</label> <input id="teacher" name="teacher" type="text" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Batch Fee</label> <input id="batchFees" name="batchFees" type="text" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Zoom Details</label> <input id="zoomDetails" name="zoomDetails" type="text" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
<!-- 					<div style="display: flex; flex-direction: column;"> -->
<!-- 						<label style="font-size: 13px; margin-bottom: 7px">Add -->
<!-- 							Students</label> <input id="" name="" type="text" required="required" -->
<!-- 							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"> -->
<!-- 					</div> -->
				</div>
				<div
					style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
					<button
						style="cursor: pointer; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none" id="saveButton">Update</button>
					
				</div>
			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
	<script type="text/javascript">
    $(document).ready(function() {
        var batchId = getUrlParameter('id');

        if (batchId) {
            getBatchDetails(batchId);
        } else {
            alert("Batch ID is missing");
        }

        function getBatchDetails(id) {
            $.ajax({
                url: "getBatchesDataById/" + id,
                type: "POST",
                contentType: "application/json",
                success: function(response) {
                    console.log("Response Data:", response);
                    if (response) {
                        populateForm(response); // Just pass the response directly
                    } else {
                        alert("No batch data found");
                    }
                },
                error: function(error) {
                    alert("Failed to fetch batch data");
                }
            });
        }

        function populateForm(batch) {
            $("#id").val(batch.id);
            $("#course").val(batch.course);
            $("#batchName").val(batch.batchName);
            $("#batchDemoDate").val(batch.batchDemoDate);
            $("#batchStartDate").val(batch.batchStartDate);
            $("#batchEndDate").val(batch.batchEndDate);
            $("#classesDay").val(batch.classesDay);
            $("#teacher").val(batch.teacher);
            $("#batchFees").val(batch.batchFees);
            $("#zoomDetails").val(batch.zoomDetails);
        }

        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        }
    });
</script>
<script>
    $(document).ready(function() {
       
        $("#saveButton").click(function() {
        	var id = $("#id").val();
            var course = $("#course").val();
            var batchName = $("#batchName").val();
            var batchDemoDate = $("#batchDemoDate").val();
            var batchStartDate = $("#batchStartDate").val();
            var batchEndDate = $("#batchEndDate").val();
            var classesDay = $("#classesDay").val();
            var teacher = $("#teacher").val();
            var batchFees = $("#batchFees").val();
            var zoomDetails = $("#zoomDetails").val();

          
            var batchData = {
            		id:id,
                course: course,
                batchName: batchName,
                batchDemoDate: batchDemoDate,
                batchStartDate: batchStartDate,
                batchEndDate: batchEndDate,
                classesDay: classesDay,
                teacher: teacher,
                batchFees:batchFees,
                zoomDetails: zoomDetails
            };

            $.ajax({
                url: "editBatches/"+ id,
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(batchData),
                success: function(response) {
                    alert(response);
                    window.location.href = "batches";
                },
                error: function(error) {
                    alert("Failed to Update Batch Details");
                }
            });
        });

        
        function getCourseData() {
            $.ajax({
                type: "get",
                contentType: "application/json",
                url: 'getCourses',
                async: false,
                success: function (response) {
                    var appenddata1 = "";
                    for (var i = 0; i < response.data.length; i++) {
                    	appenddata1 += "<option value='" + response.data[i].courses + "'>" + response.data[i].courses + "</option>";
                    }
                    $("#course").append(appenddata1);
                },
                error: function () {
                    alert("Failed to fetch courses");
                }
            });
        }
        
        getCourseData();
    });
</script>


</body>
</html>
