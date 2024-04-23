<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Course</title>
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
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div>
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">ADD
					COURSE</h1>
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Enter
							Course Name</label> <input id="courses" name="courses" type="text"
							required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
				</div>
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Category
						</label> <select id="category" name="category"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Category</option>
							<option value="Enrolled Student">Enrolled Student</option>
							<option value="Subscription Student">Subscription
								Student</option>
						</select>
					</div>
				</div>
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; margin-bottom: 7px">Description</label>
						<textarea id="description" name="description" required="required"
							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
					<button
						style="cursor: pointer; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none"
						id="saveButton">Add</button>
					<!-- <a href="managecourse">
						<button
							style="cursor: pointer; background-color: #12e068; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Manage</button>
					</a> -->
				</div>
			</div>
		</main>
	</section>
	<script>
		$(document).ready(function() {
			$("#saveButton").click(function() {
				var courses = $("#courses").val();
				var category = $("#category ").val();
				var description = $("#description ").val();

				var course = {
					courses : courses,
					category : category,
					description : description
				};

				$.ajax({
					url : "saveCourse",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(course),
					success : function(response) {
						alert(response.message);
						window.location.href = "courses";
					},
					error : function(error) {
						if (error.responseJSON && error.responseJSON.message) {
							alert(error.responseJSON.message);
						} else {
							alert("Failed to save course information");
						}
					}
				});
			});
		});
	</script>
	<script src="js/adminscript.js"></script>
</body>
</html>