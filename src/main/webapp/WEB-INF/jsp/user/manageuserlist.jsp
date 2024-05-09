<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Manage User list</title>
	<link rel="stylesheet" href="css/admin.css" />
	<link rel="stylesheet" href="css/admin.css">
	<script src="https://kit.fontawesome.com/ae73087723.js" crossorigin="anonymous"></script>
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
		overflow: scroll;
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
		right: 14.5rem;
	}
</style>

<body onload="loadTheTable()">
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div class="Container">
				<h1 style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">LIST
					ALL ADMIN USERS</h1>
				<div style="display: flex; justify-content: space-between; flex-wrap: wrap;">
					<div style="margin-left: 20px;">
						<h6 style="display: inline-block; font-size: 14px">Records</h6>
						<select style="padding: 10px; width: 70px; border-radius: 7px; height: 40px">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</div>
					<div style="margin-right: 20px;">
						<div style="display: inline;">
							<input type="text" placeholder="Search" id="searchfielld"
								style="background: none; border: none; border-bottom: 2px solid grey;  padding: 12px;">
							<span onclick="fetchthroughField()" class="fa-solid fa-magnifying-glass iconmag"></span>
						</div>
						<a href="createuser">
							<button
								style="margin-left: 30px; font-weight: 700; font-size: 14px; cursor: pointer; background-color: #20d42c; color: #ffffff; border-radius: 5px; padding: 12px; border: none">
								<i style="margin-right: 5px" class="fa-solid fa-plus"></i>Add
								New Admin User
							</button>
						</a>
					</div>
				</div>
				<div class='TableContainer'>
					<div class="tablestyle">
						<table class='MainTable'>
							<thead class='tableheading'>
								<tr style="font-weight: 900;">
									<th style="width: 100px; font-weight: 800; color: white;">SrNo</th>
									<th style="font-weight: 800; color: white;">Name</th>
									<th style="width: 350px; font-weight: 800; color: white;">Email Id</th>
									<th style="font-weight: 800; color: white;">Mobile Number</th>
									<th style="font-weight: 800; color: white;">Role</th>
									<th style="font-weight: 800; color: white;">Active / De-Active </th>
									<th style="font-weight: 800; color: white;">Action</th>
								</tr>
							</thead>
							<tbody class='tablebody'>
								<!-- 								<tr> -->
								<!-- 									<td style="font-weight: 500;">1</td> -->
								<!-- 									<td style="font-weight: 500;">Niraj Ukey</td> -->
								<!-- 									<td style="font-weight: 500;">nirajukey@gmail.com</td> -->
								<!-- 									<td style="font-weight: 500;">9874561230</td> -->
								<!-- 									<td style="font-weight: 500;">Admin</td> -->
								<!-- 									<td style="font-size: 20px;"><a><i -->
								<!-- 											class="fa-regular fa-pen-to-square" -->
								<!-- 											style="color: #12e068; font-weight: 900; padding-right: 10px"></i></a> -->
								<!-- 										<a><i class="fa-solid fa-trash" -->
								<!-- 											style="color: #eb070f; font-weight: 900;"></i></a></td> -->
								<!-- 								</tr> -->
							</tbody>
						</table>
					</div>
				</div>
				<div style="display: flex; justify-content: center; margin-top: 20px">
					<!-- 					<button -->
					<!-- 						style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: green; color: #ffffff; border-radius: 5px; font-size: 14px; font-weight: 700; padding: 15px; width: 100px; border: none">Update</button> -->
				</div>
			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
	<script type="text/javascript">

		function toggleAndCallAPI(userId) {
			toggleFlag(userId);
		}


		function loadTheTable() {
			$.ajax({
				url: "getAllUsers",
				type: "GET",
				contentType: "application/json",
				success: function (response, textStatus, xhr) {
					var tableBody = $('.tablebody');
					tableBody.empty(); // Clear existing rows

					response.forEach(function (user, index) {
						var row = $("<tr></tr>");
						row.append("<td style='font-weight: 500;'>" + (index + 1) + "</td>");
						row.append("<td style='font-weight: 500;'>" + user.name + "</td>");
						row.append("<td style='font-weight: 500;'>" + user.email + "</td>");
						row.append("<td style='font-weight: 500;'>" + user.mobileNumber + "</td>");
						// Assuming role name is present in authorities array
						var role = user.authorities.length > 0 ? user.authorities[0].roleName : "Unknown";
						row.append("<td style='font-weight: 500;'>" + role + "</td>");
						row.append("<td style='font-weight: 500;'> <label class=\"switch\"> <input id=\"\" name=\"\" type=\"checkbox\" onclick=\"toggleAndCallAPI(" + user.id + ")\" " + (user.flag ? "checked" : "") + "> <span class=\"slider round\"></span> </label></td>");


						row.append("<td style='font-size: 20px;'><a href= '/updateuser?id=" + user.id + "'><i class='fa-regular fa-pen-to-square' style='color: #12e068; font-weight: 900; padding-right: 10px'></i></a><a onclick='deleteUser(" + user.id + ")'><i class='fa-solid fa-trash' style='color: #eb070f; font-weight: 900;'></i></a></td>");
						tableBody.append(row);
					});
				},
				error: function (jqXHR, textStatus, errorThrown) {
					if (jqXHR.responseJSON && jqXHR.responseJSON.statusCode === 4001) {
						alert(jqXHR.responseJSON.message);
					} else if (jqXHR.status === 403) {
						alert("YOU DON'T HAVE THE PERMISSION !!!");
					} else {
						alert("SERVER IS NOT RESPONDING")
					}
				}
			});

		}

	</script>

	<script type="text/javascript">

		function deleteUser(userId) {


			if (confirm('Are you sure you want to delete this user?')) {
				fetch('/deleteUsers/' + userId, {
					method: 'DELETE'
				})
					.then(response => {
						if (response.ok) {
							alert("Deleted SucessFully !!!")
							window.location.href = "manageuserlist";
						} else if (response.status == 403) {
							alert("YOU DON't HAVE THE PERMISSION !!!")
							window.location.href = "manageuserlist";
						}
					})
					.catch(error => {
						console.error('Error deleting user:', error);
					});
			}
		}

	</script>


	<script>
		function toggleFlag(userId) {
			$.ajax({
				type: "PUT",
				url: "/toggle-flag/" + userId,
				success: function (response) {
					console.log(response); // Log success message
					// Update UI if needed
				},
				error: function (xhr, status, error) {
					console.error(xhr.responseText); // Log error message
					// Handle error if needed
				}
			});
		}


	</script>

	<script type="text/javascript">

		function fetchthroughField() {

			var searchfielld = $("#searchfielld").val();

			$.ajax({
				url: "getAllUsers",
				type: "GET",
				contentType: "application/json",
				//    data : JSON.stringify(data),
				success: function (data, textStatus, xhr) {
					//	alert("Sucess !!")


					function search(query) {
						const results = data.filter(item => {
							for (const key in item) {
								if (typeof item[key] === 'string' && item[key].toLowerCase().includes(query.toLowerCase())) {
									return true;
								}
							}
							return false;
						});
						return results;
					}





					// Example usage:
					const searchResult = search(searchfielld);
					// console.log(searchResult);


					var tableBody = $('.tablebody');
					tableBody.empty(); // Clear existing rows

					searchResult.forEach(function (user, index) {
						var row = $("<tr></tr>");
						row.append("<td style='font-weight: 500;'>" + (index + 1) + "</td>");
						row.append("<td style='font-weight: 500;'>" + user.name + "</td>");
						row.append("<td style='font-weight: 500;'>" + user.email + "</td>");
						row.append("<td style='font-weight: 500;'>" + user.mobileNumber + "</td>");
						// Assuming role name is present in authorities array
						var role = user.authorities.length > 0 ? user.authorities[0].roleName : "Unknown";
						row.append("<td style='font-weight: 500;'>" + role + "</td>");
						row.append("<td style='font-weight: 500;'> <label class=\"switch\"> <input id=\"\" name=\"\" type=\"checkbox\" onclick=\"toggleAndCallAPI(" + user.id + ")\" " + (user.flag ? "checked" : "") + "> <span class=\"slider round\"></span> </label></td>");


						row.append("<td style='font-size: 20px;'><a href= '/updateuser?id=" + user.id + "'><i class='fa-regular fa-pen-to-square' style='color: #12e068; font-weight: 900; padding-right: 10px'></i></a><a onclick='deleteUser(" + user.id + ")'><i class='fa-solid fa-trash' style='color: #eb070f; font-weight: 900;'></i></a></td>");
						tableBody.append(row);
					});
				},
				error: function (jqXHR, textStatus, errorThrown) {
					if (jqXHR.responseJSON && jqXHR.responseJSON.statusCode === 4001) {
						alert(jqXHR.responseJSON.message);
					} else if (jqXHR.status === 403) {
						alert("YOU DON'T HAVE THE PERMISSION !!!");
					} else {
						alert("SERVER IS NOT RESPONDING")
					}
				}
			});

		}





	</script>
</body>

</html>