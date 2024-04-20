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
	grid-template-columns: 1fr 1fr 1fr;
	grid-gap: 80px;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 30px;
}

.smallCard {
	width: 100%;
	height: 50vh;
	padding: 30px;
	border-radius: 20px;
	box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
	display: flex;
	justify-content: space-between;
	align-items: center;
	cursor: pointer;
}

.smallCard:hover {
	background: #66e0ff;
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
	color: #66e0ff;
}

.cardContent span {
	color: gray;
	font-size: 13px;
}

.icons {
	font-size: 5rem;
	color: #66e0ff;
}
</style>
<body>
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div class="container">
				<div class="container2">
					<div class='smallCard' onclick="navigateto3000()">
						<div class='cardContent'>
							
						</div>
						<div>
							<i class="fa-solid fa-clipboard-user icons"></i>
						</div>
					</div>
					<div class='smallCard' onclick="navigateto5000()">
						<div class='cardContent'>
							
						</div>
						<div>
							<i class="fa-solid fa-credit-card icons"
								style="font-size: 4.5rem"></i>
						</div>
					</div>
					<div class='smallCard' onclick="navigateto10000()">
						<div class='cardContent'>
							
						</div>
						<div>
							<i class="fa-solid fa-chalkboard-user icons"></i>
						</div>
					</div>
					<div class='smallCard' onclick="navigateto20000()">
						<div class='cardContent'>
							
						</div>
					</div>
				</div>
			</div>
		</main>
	</section>

	<script>
		function navigateto3000() {
			window.location.href = "enroll";
		}
		function navigateto5000() {
			window.location.href = "subs";
		}
		function navigateto10000() {
			window.location.href = "manageteacher";
		}
		function navigateto10000() {
			window.location.href = "managecourse";
		}
	</script>
	<script src="js/adminscript.js"></script>
	<script>

	function asideMenu(){
		// Get references to the <li> elements
		
		
		var session = "<%=session.getAttribute("user")%>";
		
		
		const enquiryFormLi = document.getElementById('admin');
		const proposalOrderLi = document.getElementById('marketing');
		const designOrderLi = document.getElementById('Design');
		
	 	enquiryFormLi.style.display = 'none';
	 	proposalOrderLi.style.display = 'none';
	 	designOrderLi.style.display = 'none';
	 	
	   


		// Display the corresponding <li> based on the presence of the elements
		if (session.includes("User Create")) {
		    enquiryFormLi.style.display = 'block'; // Or use 'list-item' to display as a list item
		} 
		
		if (session.includes("Enquiry Form")){
			proposalOrderLi.style.display = 'block';		
		}
		
		if (session.includes("Team Task")){
			designOrderLi.style.display = 'block';
		}

	}



	</script>
</body>
</html>