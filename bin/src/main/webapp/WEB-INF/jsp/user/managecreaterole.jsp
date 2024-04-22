<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Create Roles</title>
<link rel="stylesheet" href="css/admin.css" />
<link rel="stylesheet" href="css/admin.css">
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
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
	right: 12rem;
}

.btn1 {
	background-color: #00f7e7;
	padding-top: 5px;
	padding-bottom: 5px;
	border: none;
	border-radius: 5px;
	text-align: center;
	color: #ffffff;
	font-weight: 700;
	font-size: 12px;
}

.btn2 {
	background-color: #f7f300;
	padding-top: 5px;
	padding-bottom: 5px;
	border: none;
	border-radius: 5px;
	text-align: center;
	color: #ffffff;
	font-weight: 700;
	font-size: 12px;
}

.btn3 {
	background-color: #2ff507;
	padding-top: 5px;
	padding-bottom: 5px;
	border: none;
	border-radius: 5px;
	text-align: center;
	color: #ffffff;
	font-weight: 700;
	font-size: 12px;
}

.btn4 {
	background-color: #f71500;
	padding-top: 5px;
	padding-bottom: 5px;
	border: none;
	border-radius: 5px;
	text-align: center;
	color: #ffffff;
	font-weight: 700;
	font-size: 12px;
}
</style>
<body>
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div class="Container">
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">ROLES
				</h1>
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
						<a href="createroles">
							<button
								style="margin-left: 30px; font-weight: 700; font-size: 14px; cursor: pointer; background-color: #20d42c; color: #ffffff; border-radius: 5px; padding: 12px; border: none">
								<i style="margin-right: 5px" class="fa-solid fa-plus"></i>Add
								New Role
							</button>
						</a>
					</div>
				</div>
				<div class='TableContainer'>
					<div class="tablestyle">
						<table class='MainTable'>
							<thead class='tableheading'>
								<tr>
									<th style="width: 100px; font-weight: 800">SrNo</th>
									<th style="font-weight: 800">Name of the Role</th>
									<th style="width: 350px; font-weight: 800">Permission</th>
									<th style="font-weight: 800">Action</th>
								</tr>
							</thead>
							<tbody class='tablebody'>
								<tr>
									<td style="font-weight: 500">1</td>
									<td style="font-weight: 500">Ankit Nandanwar</td>
									<td>
										<div
											style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 15px">
											<button class="btn1">View</button>
											<button class="btn2">Edit</button>
											<button class="btn3">Create</button>
											<button class="btn4">Delete</button>
										</div>
									</td>
									<td style="font-size: 20px"><a href="permission"><i
											class="fa-regular fa-pen-to-square"
											style="font-weight: 900; color: #12e068; padding-right: 10px"></i></a>
										<a><i class="fa-solid fa-trash"
											style="font-weight: 900; color: #eb070f"></i></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; margin-top: 20px">
					<button
						style="cursor: pointer; font-weight: 700; background-color: #4c8aed; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Update</button>
				</div>
			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
</body>
</html>