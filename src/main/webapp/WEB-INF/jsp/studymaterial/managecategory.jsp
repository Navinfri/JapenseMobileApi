<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Category</title>
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
					CATEGORY</h1>
					<div
					style="display: flex; justify-content: space-between; flex-wrap: wrap;">
					<div style="margin-left: 20px;">
<!-- 						<h6 style="display: inline-block; font-size: 14px">Records</h6> -->
<!-- 						<select -->
<!-- 							style="padding: 10px; width: 70px; border-radius: 7px; height: 40px"> -->
<!-- 							<option>1</option> -->
<!-- 							<option>2</option> -->
<!-- 							<option>3</option> -->
<!-- 						</select> -->
					</div>
					<div style="margin-right: 20px;">
						<div style="display: inline;">
							<input type="text" placeholder="Search"
								style="background: none; border: none; border-bottom: 2px solid grey; padding: 12px;">
							<span class="fa-solid fa-magnifying-glass iconmag"></span>
						</div>
						 <a href="addcategory" style="margin-left: 20px;">
        <button style="font-weight: 700; font-size: 14px; cursor: pointer; background-color: #20d42c; color: #ffffff; border-radius: 5px; padding: 12px; border: none;">
            <i style="margin-right: 5px" class="fa-solid fa-plus"></i>Add Category
        </button>
    </a>
					</div>
				</div>
				<div class='TableContainer'>
					<div class="tablestyle">
						<table class='MainTable'>
							<thead class='tableheading'>
								<tr>
									<th style="color: white; font-weight: 800;">SrNo</th>
									<th style="color: white; font-weight: 800;">Category Name</th>
									<th style="color: white; font-weight: 800;">Action</th>
								</tr>
							</thead>
							<tbody class='tablebody'>
<!-- 								<tr> -->
<!-- 									<td>1</td> -->
<!-- 									<td>Category 1</td> -->
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
	$(document).ready(function() {
		fetchAllCategory();

	    function fetchAllCategory() {
	        $.ajax({
	            url: "/JapaneseAdminWebApp/listCategory",
	            type: "GET",
	            contentType: "application/json",
	            success: function(response) {
	                if (response && response.length > 0) {
	                    populateTable(response);
	                } else {
	                    alert("No data found");
	                }
	            },
	            error: function(jqXHR, status, errorThrown) {
                    console.error("Failed to Fetch Category:", errorThrown);
                    if (jqXHR.status === 403) {
                        alert("YOU DON'T HAVE THE PERMISSION");
                    } else {
                        alert("Failed to communicate with the server");
                    }
	        });
	    }

	    function populateTable(batches) {
	        var tableBody = $(".tablebody");
	        tableBody.empty();

	        batches.forEach(function(category, index) {
	            var row = $("<tr>");
	            row.append($("<td>").text(index + 1));
	            row.append($("<td>").text(category.category));
	           
	            var actionCell = $("<td>");
	            
	            var viewIcon = $("<i>").addClass("fa-solid fa-eye").attr("title", "View").css("color", "#007BFF").css("cursor", "pointer").css("font-size","18px").css("font.width","900").click(function() {
	            	viewCategoryDetails(category.id);
	            });

	            var updateIcon = $("<i>").addClass("fa-regular fa-pen-to-square").attr("title", "Edit").css("color", "#12e068").css("cursor", "pointer").css("font-size","18px").css("font.width","900").click(function() {
	                editCategory(category.id);
	            });

	            var deleteIcon = $("<i>").addClass("fa-solid fa-trash").css("color", "#eb070f").attr("title", "Delete").css("cursor", "pointer").css("font-size","18px").css("font.width","900").click(function() {
	                deleteCategory(category.id);
	            });

	            actionCell.append(viewIcon).append(" ");
	            actionCell.append(updateIcon).append(" ");
	            actionCell.append(deleteIcon);

	            row.append(actionCell);

	            tableBody.append(row);
	        });
	    }
	    
	    
	    function viewCategoryDetails(id) {
	        window.location.href = "viewcategory?id=" + id;
	    }

	    function editCategory(id) {
	        window.location.href = "editcategory?id=" + id;
	    }

	    function deleteCategory(id) {
	        $.ajax({
	            url: "/JapaneseAdminWebApp/deleteCategory/" + id,
	            type: "DELETE",
	            contentType: "application/json",
	            success: function(response) {
	                if (response) {
	                	
	                    alert(response);
	                    fetchAllCategory();
	                } else {
	                    alert(response);
	                }
	            },
	            error: function(jqXHR, status, errorThrown) {
                    console.error("Failed to Delete Category:", errorThrown);
                    if (jqXHR.status === 403) {
                        alert("YOU DON'T HAVE THE PERMISSION");
                    } else {
                        alert("Failed to communicate with the server");
                    }
	        });
	    }
	});

	</script>
</body>
</html>