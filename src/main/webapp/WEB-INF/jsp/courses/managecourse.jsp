<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Course</title>
<link rel="stylesheet" href="css/admin.css" />
<link rel="stylesheet" href="css/admin.css">
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
.Container {
	width: 100%;
	height: 100vh;
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
	background-color: #36454f;
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
right: 12rem;
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
					COURSE</h1>
					<div
					style="display: flex; justify-content: space-between; flex-wrap: wrap;">
					<div style="margin-left: 20px;">
						<!-- <h6 style="display: inline-block; font-size: 14px">Records</h6> -->
						<!-- <select
							style="padding: 10px; width: 70px; border-radius: 7px; height: 40px">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select> -->
					</div>
					<div style="margin-right: 20px;">
						<div style="display: inline;">
							<input type="text" placeholder="Search" id="searchInput"
								style="background: none; border: none; border-bottom: 2px solid grey; padding: 12px;">
							<span class="fa-solid fa-magnifying-glass iconmag"></span>
						</div>
						<a href="courses">
							<button
								style="margin-left: 30px; font-weight: 700; font-size: 14px; cursor: pointer; background-color: #20d42c; color: #ffffff; border-radius: 5px; padding: 12px; border: none">
								<i style="margin-right: 5px" class="fa-solid fa-plus"></i>Add
								Course
							</button>
						</a>
					</div>
				</div>
				<div class='TableContainer'>
					<div class="tablestyle">
						<table class='MainTable'>
							<thead class='tableheading'>
								<tr>
									<th style="width: 100px; font-weight: 800; color: white;">Sr No.</th>
									<th style="font-weight: 800; color: white;">Course Name</th>
									<th style="font-weight: 800; color: white;">Category</th>
									<th style="font-weight: 800; color: white;">Description</th>
									<th style="font-weight: 800; color: white;">Action</th>
								</tr>
							</thead>
							<tbody class='tablebody'>
								<!-- <tr>
									<td>1</td>
									<td>Java</td>
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
	$(document).ready(function() {
	    // Fetch all courses when the page loads
	    fetchAllCourse();

	    // Event listener for searchInput
	    $("#searchInput").on("keydown", function(event) {
    	// Check if the pressed key is Enter (keyCode 13)
    	if (event.keyCode === 13) {
        	var searchTerm = $(this).val();
        	if (searchTerm) {
            	fetchCourseByName(searchTerm);
        	} else {
            	fetchAllCourse(); // Fetch all courses if search input is empty
        	}
    	}
		});

	    function fetchAllCourse() {
	        $.ajax({
	            url: "course",
	            type: "GET",
	            contentType: "application/json",
	            success: function(response) {
	                if (response.status === "SUCCESS") {
	                    populateTable(response.data);
	                } else {
	                    alert(response.message);
	                }
	            },
	            error: function(error) {
	                alert("Failed to fetch course data");
	            }
	        });
	    }

	    function fetchCourseByName(courseName) {
	        $.ajax({
	            url: "course/" + encodeURIComponent(courseName),
	            type: "GET",
	            contentType: "application/json",
	            success: function(response) {
	                if (response.id) {
	                    populateTable([response]); // Convert the single course object to an array and populate the table
	                } else {
	                    $(".tablebody").empty(); // Clear table if course not found
	                    alert("Course not found");
	                }
	            },
	            error: function(error) {
	                alert("Failed to fetch course data");
	            }
	        });
	    }

	    function populateTable(course) {
	        var tableBody = $(".tablebody");
	        tableBody.empty(); // Clear existing rows

	        course.forEach(function(course, index) {
	            var row = $("<tr>");
	            row.append($("<td>").text(index + 1)); // Sr No.
	            row.append($("<td>").text(course.courses)); // Course
	            row.append($("<td>").text(course.category)); // Category
	            row.append($("<td>").text(course.description)); // Description

	            var actionCell = $("<td>");

	            var viewIcon = $("<i>").addClass("fa-solid fa-eye").attr("title", "View").css("color", "#007BFF").css("cursor", "pointer").click(function() {
	                viewCourseDetails(course.id);
	            });

	            var updateIcon = $("<i>").addClass("fa-regular fa-pen-to-square").attr("title", "Edit").css("color", "#12e068").css("cursor", "pointer").click(function() {
	                editCourse(course.id);
	            });

	            var deleteIcon = $("<i>").addClass("fa-solid fa-trash").attr("title", "Delete").css("color", "#eb070f").css("cursor", "pointer").click(function() {
	                deleteCourse(course.id);
	            });

	            actionCell.append(viewIcon).append(" "); // Add a space between icons
	            actionCell.append(updateIcon).append(" "); // Add a space between icons
	            actionCell.append(deleteIcon);

	            row.append(actionCell); // Action

	            tableBody.append(row);
	        });
	    }

	    function viewCourseDetails(id) {
	        window.location.href = "viewCourses?id=" + id;
	    }

	    function editCourse(id) {
	        window.location.href = "editCourse?id=" + id;
	    }

	    function deleteCourse(id) {
	        $.ajax({
	            url: "deleteCourse/" + id,
	            type: "DELETE",
	            contentType: "application/json",
	            success: function(response) {
	                if (response.status === "SUCCESS") {
	                    fetchAllCourse(); // Refresh the table after deletion
	                    alert(response.message);
	                } else {
	                    alert(response.message);
	                }
	            },
	            error: function(error) {
	                alert("Failed to delete course");
	            }
	        });
	    }
	});
	</script>
	<script src="js/adminscript.js"></script>
</body>
</html>