<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/admin.css" />
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
<title>Dashboard</title>
</head>
<style>
.container {
	width: 100%;
	height: 100vh;
}

.container2 {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-gap: 50px;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 30px;
}

.smallCard {
	width: 100%;
	padding: 30px;
	border-radius: 20px;
	box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
	display: flex;
	justify-content: space-between;
	align-items: center;
	cursor: pointer;
}

.smallCard:hover {
	background: rgb(16, 8, 92);
	transition: .8s ease;
}

.smallCard:hover .cardContent h2 {
	color: white;
}

.smallCard:hover .cardContent span {
	color: white;
}

.smallCard:hover .icons {
	color: white;
}

.cardContent h2 {
	color: rgb(16, 8, 92);
}

.cardContent span {
	color: rgb(16, 8, 92);
	font-size: 13px;
}

.icons {
	font-size: 5rem;
	color: rgb(16, 8, 92);
}
</style>
<body>
	<jsp:include page="sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="header.jsp"></jsp:include>
		<main>
			<div class="container">
				<div class="container2">
					<div id="totalEnrolledStudents" class='smallCard' onclick="navigateenroll()">
						<div class='cardContent'>
							<h2>250</h2>
							<span>Total Enrolled Students</span>
						</div>
						<div>
							<i class="fa-solid fa-clipboard-user icons"></i>
						</div>
					</div>
					<div id = "totalSubscriptionStudents" class='smallCard' onclick="navigatetoSubs()">
						<div class='cardContent'>
							<h2>150</h2>
							<span>Total Subscription Students</span>
						</div>
						<div>
							<i class="fa-solid fa-credit-card icons"
								style="font-size: 4.5rem"></i>
						</div>
					</div>
					<div id="noofTeachers" class='smallCard' onclick="navigatetoTeach()">
						<div class='cardContent'>
							<h2>72</h2>
							<span>No of Teachers</span>
						</div>
						<div>
							<i class="fa-solid fa-chalkboard-user icons"></i>
						</div>
					</div>
					<div id ="totalCourses" class='smallCard' onclick="navigatetoCourse()">
						<div class='cardContent'>
							<h2>25</h2>
							<span>Total Courses</span>
						</div>
						<div>
							<i class="fa-solid fa-book-open icons"></i>
						</div>
					</div>
					<div id="totalBatches" class='smallCard' onclick="navigatetoBatch()">
						<div class='cardContent'>
							<h2>30</h2>
							<span>Total Batches</span>
						</div>
						<div>
							<i class="fa-solid fa-people-group icons"></i>
						</div>
					</div>
					<div id ="subscriptions" class='smallCard' onclick="navigatetoTeach()">
						<div class='cardContent'>
							<h2>5</h2>
							<span>Subscriptions</span>
						</div>
						<div>
							<i class="fa-regular fa-money-bill-1 icons"></i>
						</div>
					</div>
				</div>
			</div>
		</main>
	</section>

	<script>
		function navigateenroll() {
			window.location.href = "enroll";
		}
		function navigatetoSubs() {
			window.location.href = "subs";
		}
		function navigatetoTeach() {
			window.location.href = "manageteacher";
		}
		function navigatetoCourse() {
			window.location.href = "managecourse";
		}
		function navigatetoBatch() {
			window.location.href = "managebatch";
		}
		function navigatetoTeach() {
			window.location.href = "manageteacher";
		}
	</script>
	<script src="js/adminscript.js"></script>
	
	
	
</body>
</html>