<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Teacher</title>
<link rel="stylesheet" href="css/admin.css" />
<link rel="stylesheet" href="css/admin.css">
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
.Container {
	width: 100%;
	height: 100%;
	margin-top: 50px
}

.container2 {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
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
	width: 100%;
}

.tableheading {
	border-bottom: 1px solid rgb(208, 208, 208);
}

.tableheading th {
	padding: 1rem;
	text-transform: capitalize;
	letter-spacing: 0.1rem;
	font-size: 0.9rem;
	font-weight: 600;
	color: rgb(56, 56, 56);
}

.tablebody {
	padding: 1rem 1.8rem;
	font-weight: 500;
	font-size: 13.5px;
}

.iconmag {
	position: absolute;
	top: 12.5rem;
	right: 2rem;
}
</style>
<body>
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div class="Container">
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">MANAGE
					TEACHER</h1>
				<div
					style="display: flex; justify-content: space-between; flex-wrap: wrap;">
					<div style="margin-left: 20px;">
						<h6 style="display: inline-block; font-size: 14px">Records</h6>
						<select
							style="padding: 10px; width: 70px; border-radius: 7px; height: 40px">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</div>
					<div style="margin-right: 20px;">
						<div style="display: inline;">
							<input type="text" placeholder="Search"
								style="background: none; border: none; border-bottom: 2px solid grey; padding: 12px;">
							<span class="fa-solid fa-magnifying-glass iconmag"></span>
						</div>
					</div>
				</div>
				<div class='TableContainer'>
					<div class="tablestyle">
						<table class='MainTable'>
							<thead class='tableheading'>
								<tr>
									<th style="width: 100px; font-weight: 800;">SrNo</th>
									<th style="font-weight: 800;">First Name</th>
									<th style="font-weight: 800;">Last Name</th>
									<th style="font-weight: 800;">Select Course</th>
									<th style="font-weight: 800;">Select Batch</th>
									<th style="width: 350px; font-weight: 800;">Email Id</th>
									<th style="font-weight: 800;">Action</th>
								</tr>
							</thead>
							<tbody class='tablebody'>
								<!-- <tr>
									<td>1</td>
									<td>Prajwal</td>
									<td>Amdare</td>
									<td>Java</td>
									<td>Batch 1</td>
									<td>prajwalamdare@gmail.com</td>
									<td><a><i class="fa-regular fa-pen-to-square"
											style="color: #12e068; padding-right: 10px"></i></a> <a><i
											class="fa-solid fa-trash" style="color: #eb070f"></i></a></td>
								</tr> -->
							</tbody>
						</table>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; margin-top: 20px">
					<!-- <button
						style="cursor: pointer; background-color: green; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Update</button> -->
				</div>
			</div>
		</main>
	</section>
	<script>
		$(document).ready(
				function() {
					// Fetch all teachers when the page loads
					fetchAllTeachers();

					function fetchAllTeachers() {
						$.ajax({
							url : "getAllTeacher",
							type : "GET",
							contentType : "application/json",
							success : function(response) {
								if (response.status === "SUCCESS") {
									populateTable(response.data);
								} else {
									alert(response.message);
								}
							},
							error : function(error) {
								alert("Failed to fetch teachers data");
							}
						});
					}

					function populateTable(teachers) {
						var tableBody = $(".tablebody");
						tableBody.empty(); // Clear existing rows

						teachers.forEach(function(teacher, index) {
							var row = $("<tr>");
							row.append($("<td>").text(index + 1)); // SrNo
							row.append($("<td>").text(teacher.firstName)); // First Name
							row.append($("<td>").text(teacher.lastName)); // Last Name
							row.append($("<td>").text(teacher.courses)); // Select Course
							row.append($("<td>").text(teacher.batch)); // Select Batch
							row.append($("<td>").text(teacher.emailId)); // Email Id

							var actionCell = $("<td>");

							var updateIcon = $("<i>").addClass(
									"fa-regular fa-pen-to-square").css("color",
									"#12e068").css("cursor", "pointer").click(
									function() {
										editTeacher(teacher.id);
									});

							var deleteIcon = $("<i>").addClass(
									"fa-solid fa-trash")
									.css("color", "#eb070f").css("cursor",
											"pointer").click(function() {
										deleteTeacher(teacher.id);
									});

							actionCell.append(updateIcon).append(" "); // Add a space between icons
							actionCell.append(deleteIcon);

							row.append(actionCell); // Action

							tableBody.append(row);
						});
					}

					function editTeacher(id) {
						window.location.href = "editTeacher?id=" + id;
					}

					function deleteTeacher(id) {
						$.ajax({
							url : "deleteTeacher/" + id,
							type : "DELETE",
							contentType : "application/json",
							success : function(response) {
								if (response.status === "SUCCESS") {
									fetchAllTeachers(); // Refresh the table after deletion
									alert(response.message);
								} else {
									alert(response.message);
								}
							},
							error : function(error) {
								alert("Failed to delete teacher");
							}
						});
					}
				});
	</script>
	<script src="js/adminscript.js"></script>
</body>
</html>