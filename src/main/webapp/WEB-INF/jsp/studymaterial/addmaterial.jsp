<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Material</title>
<link rel="stylesheet" href="css/admin.css">
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
</head>
<style>
.Container {
	width: 100%;
	height: 100vh;
}

.container2 {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-gap: 30px;
}

@media screen and (max-width: 1000px) {
	.container2 {
		grid-template-columns: 1fr;
	}
}
</style>
<body>
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div>
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">ADD
					STUDY MATERIAL</h1>
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Title</label> <input id="" name="" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Material Used For</label> <select id="" name=""
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
							<option>Subscription</option>
							<option>Live Classes</option>
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Course</label> <select id="" name=""
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
							<option>Subscription</option>
							<option>Live Classes</option>
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Category</label> <select id="" name=""
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
							<option>Subscription</option>
							<option>Live Classes</option>
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Chapter Name</label> <input id="" name="" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Type of Question</label> <select id="" name=""
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
							<option>Subscription</option>
							<option>Live Classes</option>
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">
							Set Time Limit</label> <input id="" name="" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Start Date</label> <input id="" name="" type="date" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							End Date</label> <input id="" name="" type="date" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Limit to Display</label> <input id="" name="" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">
							Total Score of Question </label> <input id="" name="" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">
							Note</label> <input id="" name="" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
					<button
						style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Add</button>
					<a href="manageaddmaterial">
						<button
							style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #12e068; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Manage</button>
					</a>
				</div>
			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
</body>
</html>