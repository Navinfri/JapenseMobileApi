<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Manage Batch</title>
		<link rel="stylesheet" href="css/admin.css" />
		<link rel="stylesheet" href="css/admin.css">
		<script src="https://kit.fontawesome.com/ae73087723.js" crossorigin="anonymous"></script>
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
			padding: 2px;
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
					<h1 style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">MANAGE
						BATCH</h1>
					<div style="display: flex; justify-content: space-between; flex-wrap: wrap;">
						<div style="margin-left: 20px;">
<!-- 							<h6 style="display: inline-block; font-size: 14px">Records</h6> -->
<!-- 							<select style="padding: 10px; width: 70px; border-radius: 7px; height: 40px"> -->
<!-- 								<option>1</option> -->
<!-- 								<option>2</option> -->
<!-- 								<option>3</option> -->
<!-- 							</select> -->
						</div>
						<div style="margin-right: 20px; display: flex; align-items: center;">
    <div style="flex: 1; display: flex; align-items: center;">
        <input type="text" placeholder="Search" id="searchInput" style="background: none; border: none; border-bottom: 2px solid grey; padding: 12px; flex: 1;">
        <span class="fa-solid fa-magnifying-glass iconmag" style="margin-left: -30px;"></span>
    </div>
    <a href="batches" style="margin-left: 20px;">
        <button style="font-weight: 700; font-size: 14px; cursor: pointer; background-color: #20d42c; color: #ffffff; border-radius: 5px; padding: 12px; border: none;">
            <i style="margin-right: 5px" class="fa-solid fa-plus"></i>Add Batch
        </button>
    </a>
</div>



					
					<div class='TableContainer'>
						<div class="tablestyle">
							<table class='MainTable'>
								<thead class='tableheading'>
									<tr>
										<th style="width: 100px; font-weight: 800; color: white;">SrNo</th>
										<!-- 									<th style="width: 180px; font-weight: 800; color: white;">Batch Name</th> -->
										<th style="width: 180px; font-weight: 800; color: white;">Course</th>
										<th style="width: 180px; font-weight: 800; color: white;">Batch Name</th>
										<th style="width: 800px; font-weight: 800; color: white;">Demo Date</th>
										<th style="width: 180px; font-weight: 800; color: white;">Start Date</th>
										<th style="width: 180px; font-weight: 800; color: white;">End Date</th>
										<th style="width: 180px; font-weight: 1800; color: white;">Classes Days</th>
										<th style="width: 180px; font-weight: 800; color: white;">Assign Teacher</th>
										<th style="width: 180px; font-weight: 800; color: white;">Batch Fee</th>
										<th style="width: 180px; font-weight: 800; color: white;">Zoom Details</th>
										<!-- 									<th style="width: 180px">Add Students</th> -->
										<th style="font-weight: 800; color: white;">Action</th>
									</tr>
								</thead>
								<tbody class='tablebody'>
									<!-- 								<tr> -->
									<!-- 									<td>1</td> -->
									<!-- 									<td>Batch 1</td> -->
									<!-- 									<td></td> -->
									<!-- 									<td></td> -->
									<!-- 									<td></td> -->
									<!-- 									<td></td> -->
									<!-- 									<td></td> -->
									<!-- 									<td></td> -->
									<!-- 									<td></td> -->
									<!-- 									<td></td> -->
									<!-- 									<td></td> -->
									<!-- 									<td></td> -->
									<!-- 									<td><a><i class="fa-regular fa-pen-to-square" -->
									<!-- 											style="color: #12e068; padding-right: 10px"></i></a> <a><i -->
									<!-- 											class="fa-solid fa-trash" style="color: #eb070f"></i></a></td> -->
									<!-- 								</tr> -->
								</tbody>
							</table>
						</div>
					</div>
					<!-- 				<div -->
					<!-- 					style="display: flex; justify-content: center; margin-top: 20px"> -->
					<!-- 					<button -->
					<!-- 						style="cursor: pointer; background-color: green; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Update</button> -->
					<!-- 				</div> -->
				</div>
			</main>
		</section>
		<script src="js/adminscript.js"></script>
		<script>
		$(document).ready(function () {
		    fetchAllBatches();

		    function fetchAllBatches() {
		        $.ajax({
		            url: "getAllBatchesData",
		            type: "GET",
		            contentType: "application/json",
		            success: function (response) {
		                if (response && response.length > 0) {
		                    populateTable(response);
		                } else {
		                    alert("No data found");
		                }
		            },
		            error: function (xhr, status, error) {
		                console.error("Failed to fetch batch data:", error);
		                alert("Failed to fetch batch data");
		            }
		        });
		    }

		    function populateTable(batches) {
		        var tableBody = $(".tablebody");
		        tableBody.empty();

		        batches.forEach(function (batch, index) {
		            var row = $("<tr>");
		            row.append($("<td>").text(index + 1));
		            row.append($("<td>").text(batch.course));
		            row.append($("<td>").text(batch.batchName));
		            row.append($("<td>").text(batch.batchDemoDate));
		            row.append($("<td>").text(batch.batchStartDate));
		            row.append($("<td>").text(batch.batchEndDate));

		            var classesData = JSON.parse(batch.classesDay);
		            var formattedClassesDay = retrieveClassesDay(classesData);
		            row.append($("<td>").text(formattedClassesDay));

		            row.append($("<td>").text(batch.teacher));
		            row.append($("<td>").text(batch.batchFees));
		            row.append($("<td>").text(batch.zoomDetails));

		            var actionCell = $("<td>");
		            
		            var viewIcon = $("<i>").addClass("fa-solid fa-eye").attr("title", "View").css("color", "#007BFF").css("cursor", "pointer").css("font-size","18px").css("font.width","900").click(function() {
		                viewBatchDetails(batch.id);
		            });

		            var updateIcon = $("<i>").addClass("fa-regular fa-pen-to-square").attr("title", "Edit").css("color", "#12e068").css("cursor", "pointer").css("font-size","18px").css("font.width","900").click(function () {
		                editBatch(batch.id);
		            });

		            var deleteIcon = $("<i>").addClass("fa-solid fa-trash").attr("title", "Delete").css("color", "#eb070f").css("cursor", "pointer").css("font-size","18px").css("font.width","900").click(function () {
		                deleteBatch(batch.id);
		            });

		            actionCell.append(viewIcon).append(" ");
		            actionCell.append(updateIcon).append(" ");
		            actionCell.append(deleteIcon);

		            row.append(actionCell);

		            tableBody.append(row);
		        });
		    }

		    function retrieveClassesDay(classesData) {
		        var classesDay = "";

		        try {
		            if (Array.isArray(classesData) && classesData.length > 0) {
		                classesData.forEach(function (data) {
		                    if (data.day && data.startTime && data.endTime) {
		                        classesDay += data.day + " " + data.startTime + "-" + data.endTime + ", ";
		                    } else {
		                        console.error("Invalid data format in classesData:", data);
		                    }
		                });
		                classesDay = classesDay.slice(0, -2); // Remove the trailing comma and space
		            } else {
		                console.warn("No classesData found or classesData is not an array.");
		            }
		        } catch (error) {
		            console.error("Error retrieving classesDay:", error);
		        }

		        return classesDay;
		    }

		    
		    function viewBatchDetails(id) {
		        window.location.href = "viewBatch?id=" + id;
		    }

		    function editBatch(id) {
		        window.location.href = "editBatch?id=" + id;
		    }

		    function deleteBatch(id) {
		        $.ajax({
		            url: "deleteBatches/" + id,
		            type: "POST",
		            contentType: "application/json",
		            success: function (response) {
		                if (response) {
		                    alert(response);
		                    fetchAllBatches();
		                } else {
		                    alert("Failed to delete batch");
		                }
		            },
		            error: function (xhr, status, error) {
		                console.error("Failed to delete batch:", error);
		                alert("Failed to delete batch");
		            }
		        });
		    }
		});

		</script>
	</body>

	</html>