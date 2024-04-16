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
			<form action="" method="PUT">
				<div>
					<h1
						style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">UPDATE
						COURSE</h1>
					<input type="hidden" id="id" name="id"> <input
						type="hidden" id="date" name="date">
					<div class="container2"
						style="margin-left: 20px; margin-right: 20px">
						<div style="display: flex; flex-direction: column;">
							<label style="font-size: 13px; margin-bottom: 7px">Enter
								Course</label> <input id="courses" name="courses" type="text"
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
							id="saveButton">Update</button>
					</div>
				</div>
			</form>
		</main>
	</section>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var courseId = getUrlParameter('id');

					if (courseId) {
						getCourseDetails(courseId);
					} else {
						alert("Course ID is missing");
					}

					function getCourseDetails(id) {
						$.ajax({
							url : "courses/" + id,
							type : "GET",
							contentType : "application/json",
							success : function(response) {
								console.log("Response Data:", response);
								if (response.status === "SUCCESS") {
									populateForm(response.data);
								} else {
									alert(response.message);
								}
							},
							error : function(error) {
								alert("Failed to fetch course data");
							}
						});
					}

					function populateForm(course) {
						$("#id").val(course.id);
						$("#date").val(course.date);
						$("#courses").val(course.courses);
						$("#category").val(course.category);
						$("#description").val(course.description);
					}

					$("#saveButton").click(function(event) {
						event.preventDefault();
						var courseData = {
							id : $("#id").val(),
							date : $("#date").val(),
							courses : $("#courses").val(),
							category : $("#category").val(),
							description : $("#description").val()
						};

						updateCourse(courseData);
					});

					function updateCourse(data) {
						$.ajax({
							url : "updateCourse/" + data.id,
							type : "PUT",
							contentType : "application/json",
							data : JSON.stringify(data),
							success : function(response) {
								if (response.status === "SUCCESS") {
									alert(response.message);
									window.location.href = "managecourse"; // Redirect to the correct URL
								} else {
									alert(response.message);
								}
							},
							error : function(error) {
								alert("Failed to update course information");
							}
						});
					}

					function getUrlParameter(name) {
						name = name.replace(/[\[]/, '\\[').replace(/[\]]/,
								'\\]');
						var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
						var results = regex.exec(location.search);
						return results === null ? ''
								: decodeURIComponent(results[1].replace(/\+/g,
										' '));
					}
				});
	</script>
	<script src="js/adminscript.js"></script>
</body>
</html>