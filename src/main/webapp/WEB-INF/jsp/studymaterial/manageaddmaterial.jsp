<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Material</title>
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
	background-color: #36454f;
}

.tableheading th {
	padding: 1rem;
	text-transform: capitalize;
	letter-spacing: 0.1rem;
	font-size: 0.9rem;
	font-weight: 600;
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
					MATERIAL</h1>
					<div
					style="display: flex; justify-content: space-between; flex-wrap: wrap;">
					<div style="margin-left: 20px;">
						
					</div>
					<div style="margin-right: 20px;">
						<div style="display: inline;">
							<input type="text" placeholder="Search"
								style="background: none; border: none; border-bottom: 2px solid grey; padding: 12px;">
							<span class="fa-solid fa-magnifying-glass iconmag"></span>
						</div>
						<a href="batches" style="margin-left: 20px;">
        <button style="font-weight: 700; font-size: 14px; cursor: pointer; background-color: #20d42c; color: #ffffff; border-radius: 5px; padding: 12px; border: none;">
            <i style="margin-right: 5px" class="fa-solid fa-plus"></i>Add Batch
        </button>
    </a>
					</div>
				</div>
				<div class='TableContainer'>
					<div class="tablestyle">
						<table class='MainTable'>
							<thead class='tableheading'>
								<tr>
									<th style="font-weight: 800; color: white;">SrNo</th>
									<th style="font-weight: 800; color: white;">Title</th>
									<th style="font-weight: 800; color: white;">Material Used For</th>
									<th style="font-weight: 800; color: white;">Category</th>
									<th style="font-weight: 800; color: white;">Chapter Name</th>
									<th style="font-weight: 800; color: white;">Type of Question</th>
									<th style="font-weight: 800; color: white;">Time Limit</th>
									<th style="font-weight: 800; color: white;">Question Limit</th>
									<th style="font-weight: 800; color: white;">Start Date</th>
									<th style="font-weight: 800; color: white;">End Date</th>
									<th style="font-weight: 800; color: white;">Actions</th>
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
		$(document).ready(function () {
		    fetchAllMaterial();

		    function fetchAllMaterial() {
		        $.ajax({
		            url: "/JapaneseAdminWebApp/getAddMaterial",
		            type: "GET",
		            contentType: "application/json",
		            success: function (response) {
		                if (response && response.length > 0) {
		                    populateTable(response);
		                } else {
		                    alert("No data found");
		                }
		            },
		            error: function (jqXHR, status, errorThrown) {
	                    if (jqXHR.status === 403) {
	                        alert("YOU DON'T HAVE THE PERMISSION");
	                    } else {
	                        alert("Failed to communicate with the server");
	                    }
	                }
		        });
		    }

		    function populateTable(material) {
		        var tableBody = $(".tablebody");
		        tableBody.empty();

		        material.forEach(function (material, index) {
		            var row = $("<tr>");
		            row.append($("<td>").text(index + 1));
		            row.append($("<td>").text(material.title));
		            row.append($("<td>").text(material.meterialUsed));
		            row.append($("<td>").text(material.category));
		            row.append($("<td>").text(material.chapterName));
		            row.append($("<td>").text(material.typeOfQuestion));
		            row.append($("<td>").text(material.timeLimit));
		            row.append($("<td>").text(material.queLimitToDisplay));
		            row.append($("<td>").text(material.startDate));
		            row.append($("<td>").text(material.endDate));
		            

		            var actionCell = $("<td>");
		            
		            var viewIcon = $("<i>").addClass("fa-solid fa-eye").attr("title", "View").css("color", "#007BFF").css("cursor", "pointer").css("font-size","18px").css("font.width","900").click(function() {
		                viewMaterialDetails(material.id);
		            });

		            var updateIcon = $("<i>").addClass("fa-regular fa-pen-to-square").attr("title", "Edit").css("color", "#12e068").css("cursor", "pointer").css("font-size","18px").css("font.width","900").click(function () {
		                editMaterial(material.id);
		            });

		            var deleteIcon = $("<i>").addClass("fa-solid fa-trash").attr("title", "Delete").css("color", "#eb070f").css("cursor", "pointer").css("font-size","18px").css("font.width","900").click(function () {
		                deleteMaterial(material.id);
		            });

		            actionCell.append(viewIcon).append(" ");
		            actionCell.append(updateIcon).append(" ");
		            actionCell.append(deleteIcon);

		            row.append(actionCell);

		            tableBody.append(row);
		        });
		    }

		    
		    function viewMaterialDetails(id) {
		        window.location.href = "viewAddMaterial?id=" + id;
		    }

		    function editBatch(id) {
		        window.location.href = "editAddMaterial?id=" + id;
		    }

		    function deleteMaterial(id) {
		        $.ajax({
		            url: "JapaneseAdminWebApp/deleteAddMaterial/" + id,
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
		            error: function (jqXHR, status, errorThrown) {
	                    if (jqXHR.status === 403) {
	                        alert("YOU DON'T HAVE THE PERMISSION");
	                    } else {
	                        alert("Failed to communicate with the server");
	                    }
	                }
	            });
	        }

	    });


		</script>
</body>
</html>