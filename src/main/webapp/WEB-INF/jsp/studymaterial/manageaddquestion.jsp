<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Add Question</title>
<link rel="stylesheet" href="css/admin.css" />
<link rel="stylesheet" href="css/admin.css">
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
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
					QUESTIONS</h1>
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
									<th style="font-weight: 800; color: white; width: fit-content;">SrNo</th>
									<th style="font-weight: 800; color: white;">Title</th>
									<th style="font-weight: 800; color: white; width:auto ;">Material Used For</th>
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
								<tr>
									<td style="font-weight: 500;">1</td>
									<td style="font-weight: 500;">Material 1</td>
									<td style="font-weight: 500;"></td>
									<td style="font-weight: 500;"></td>
									<td style="font-weight: 500;"></td>
									<td style="font-weight: 500;"></td>
									<td style="font-weight: 500;"></td>
									<td style="font-weight: 500;"></td>
									<td style="font-weight: 500;"></td>
									<td style="font-weight: 500;"></td>
									<td style="font-size: 20px;"><a><i class="fa-regular fa-pen-to-square"
											style="color: #12e068; font-weight: 900; padding-right: 10px"></i></a> <a><i
											class="fa-solid fa-trash" style="color: #eb070f; font-weight: 900;"></i></a></td>
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