<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Question Type</title>
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
	overflow: scroll;
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
	text-align: center;
}

.tablebody {
	padding: 1rem 1.8rem;
	font-weight: 500;
	font-size: 13.5px;
	text-align: center;
}
</style>
<body>
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../navbar.jsp"></jsp:include>
		<main>
			<div class="Container">
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">MANAGE
					QUESTION TYPE</h1>
				<div class='TableContainer'>
					<div class="tablestyle">
						<table class='MainTable'>
							<thead class='tableheading'>
								<tr>
									<th>SrNo</th>
									<th>Question Type</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody class='tablebody'>
								
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
	<script>
	$(document).ready(function() {
		fetchAllQuestions();

	    function fetchAllQuestions() {
	        $.ajax({
	            url: "listAllQuestions",
	            type: "GET",
	            contentType: "application/json",
	            success: function(response) {
	                if (response && response.length > 0) {
	                    populateTable(response);
	                } else {
	                    alert("No data found");
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("Failed to fetch questions type :", error);
	                alert("Failed to questions type");
	            }
	        });
	    }

	    function populateTable(questions) {
	        var tableBody = $(".tablebody");
	        tableBody.empty();

	        questions.forEach(function(question, index) {
	            var row = $("<tr>");
	            row.append($("<td>").text(index + 1));
	            row.append($("<td>").text(question.typeOfQuestion));
	           
	            var actionCell = $("<td>");

	            var updateIcon = $("<i>").addClass("fa-regular fa-pen-to-square").css("color", "#12e068").css("cursor", "pointer").click(function() {
	                editQuestion(question.id);
	            });

	            var deleteIcon = $("<i>").addClass("fa-solid fa-trash").css("color", "#eb070f").css("cursor", "pointer").click(function() {
	                deleteQuestion(question.id);
	            });

	            actionCell.append(updateIcon).append(" ");
	            actionCell.append(deleteIcon);

	            row.append(actionCell);

	            tableBody.append(row);
	        });
	    }

	    function editQuestion(id) {
	        window.location.href = "editquestype?id=" + id;
	    }

	    function deleteQuestion(id) {
	        $.ajax({
	            url: "deleteQueType/" + id,
	            type: "DELETE",
	            contentType: "application/json",
	            success: function(response) {
	                if (response) {
	                	
	                    alert(response);
	                    fetchAllQuestions();
	                } else {
	                    alert(response);
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("Failed to delete questions type:", error);
	                alert("Failed to delete questions type");
	            }
	        });
	    }
	});

	</script>
</body>
</html>