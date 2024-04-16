<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
</style>
<body>
<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div class="Container">
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">EDIT
					ROLE FORM</h1>
					<div class="container2">
				<div style="display: flex; flex-direction: column; margin-left: 20px">
					<label style="font-size: 13px; margin-bottom: 7px">Enter
						Role Name</label> <input id="" name="" type="text"
						style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"></div>
				</div>
				<div class='TableContainer'>
					<div class="tablestyle">
					<div>
					<input type="checkbox">
					<label>SELECT ALL</label>
					</div>
						<table class='MainTable'>
							<thead class='tableheading'>
								<tr>
									<th>Permission</th>
									<th>View</th>
									<th>Edit</th>
									<th>Create</th>
									<th>Delete</th>
									<th>All Data <span style="text-transform: lowercase;">(all permission)</span></th>
								</tr>
							</thead>
							<tbody class='tablebody'>
							<tr style="border-bottom: 1px solid rgb(208, 208, 208);">
							<td style="color: lightgreen">ADMIN USERS</td>
							</tr>
							<tr>
							<td style="color: #ed2d07">Admin Users</td>
							</tr>
								<tr>
									<td style="font-weight: 500">List All Admin Users</td>
									<td>
									<input type="checkbox">
									</td>
									<td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td>
								</tr>
								<tr style="border-bottom: 1px solid rgb(208, 208, 208);">
									<td style="font-weight: 500">Add Admin Users</td>
									<td>
									<input type="checkbox">
									</td>
									<td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td>
								</tr>
								<tr>
							<td style="color: #ed2d07">Manage Roles</td>
							</tr>
								<tr>
									<td style="font-weight: 500">List Role</td>
									<td>
									<input type="checkbox">
									</td>
									<td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td>
								</tr>
								<tr>
									<td style="font-weight: 500">Add New Role</td>
									<td>
									<input type="checkbox">
									</td>
									<td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td><td>
									<input type="checkbox">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; margin-top: 20px">
					<button
						style="cursor: pointer; background-color: green; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Update</button>
				</div>
			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
</body>
</html>