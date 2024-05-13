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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
							Title</label> <input id="title" name="title" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Material Used For</label> <select id="meterialUsed" name="meterialUsed"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select</option>
							<option>Subscription</option>
							<option>Live Classes</option>
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Course</label> <select id="course" name="course"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Course</option>
							
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Category</label> <select id="category" name="category"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Category</option>
							
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Chapter Name</label> <input id="chapterName" name="chapterName" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Type of Question</label> <select id="typeOfQuestion" name="typeOfQuestion"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Question Type</option>
							
						</select>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">
							Set Time Limit</label> <input id="timeLimit" name="timeLimit" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Start Date</label> <div style="display: flex;">
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="day" id="day"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="month" id="month"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="year" id="year"></select>
							</div>
						</div>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							End Date</label> <div style="display: flex;">
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="day1" id="day1"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="month1" id="month1"></select>
							</div>
							<div>
								<select style="padding: 13px; border: 1px solid lightgrey"
									name="year1" id="year1"></select>
							</div>
						</div>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
							Limit to Display</label> <input id="queLimitToDisplay" name="queLimitToDisplay" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">
							Total Score of Question </label> <input id="score" name="score" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">
							Note</label> <input id="note" name="note" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
					<button id="saveButton"
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function getCourseData() {
        $.ajax({
            type: "GET",
            url: 'course',
            dataType: 'json', 
            success: function(response) {
                var appenddata1 = "";
                for (var i = 0; i < response.data.length; i++) {
                    appenddata1 += "<option value='" + response.data[i].courses + "'>" + response.data[i].courses + "</option>";
                }
                $("#course").append(appenddata1);
            },
            error: function() {
                alert("Failed to fetch courses");
            }
        });
    }

    // Call the function after its declaration
    $(document).ready(function() {
        getCourseData();
    });
</script>
<script type="text/javascript">
function getQuestionData() {
    $.ajax({
        type: "GET",
        url: '/listAllQuestions', 
        dataType: 'json', 
        success: function(response) {
            var appenddata1 = "";
           
            for (var i = 0; i < response.length; i++) {
                appenddata1 += "<option value='" + response[i].typeOfQuestion + "'>" + response[i].typeOfQuestion + "</option>";
            }
            $("#typeOfQuestion").append(appenddata1);
        },
        error: function() {
            alert("Failed to fetch questions");
        }
    });
}

$(document).ready(function() {
    getQuestionData();
});

</script>
<script type="text/javascript">
function getCategoryData() {
    $.ajax({
        type: "GET",
        url: '/listCategory', 
        dataType: 'json', 
        success: function(response) {
            var appenddata1 = "";
           
            for (var i = 0; i < response.length; i++) {
                appenddata1 += "<option value='" + response[i].category + "'>" + response[i].category + "</option>";
            }
            $("#category").append(appenddata1);
        },
        error: function() {
            alert("Failed to fetch questions");
        }
    });
}

$(document).ready(function() {
	getCategoryData();
});

</script>
<script>
    const yearSelect = document.getElementById("year");
    const monthSelect = document.getElementById("month");
    const daySelect = document.getElementById("day");

    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    (function populateMonths() {
        for (let i = 0; i < months.length; i++) {
            const option = document.createElement('option');
            option.textContent = months[i];
            monthSelect.appendChild(option);
        }
        monthSelect.value = "January";
    })();

    function populateDays(month) {
        while (daySelect.firstChild) {
            daySelect.removeChild(daySelect.firstChild);
        }

        let dayNum;

        if (month === 'January' || month === 'March' || month === 'May'
            || month === 'July' || month === 'August'
            || month === 'October' || month === 'December') {
            dayNum = 31;
        } else if (month === 'April' || month === 'June'
            || month === 'September' || month === 'November') {
            dayNum = 30;
        }

        for (let i = 1; i <= dayNum; i++) {
            const option = document.createElement("option");
            option.textContent = i;
            daySelect.appendChild(option);
        }
    }

    function populateYears() {
        let year = new Date().getFullYear();
        for (let i = 0; i < 101; i++) {
            const option = document.createElement("option");
            option.textContent = year - i;
            yearSelect.appendChild(option);
        }
    }

    populateDays(monthSelect.value);
    populateYears();
</script>

<script>
    const yearSelect1 = document.getElementById("year1");
    const monthSelect1 = document.getElementById("month1");
    const daySelect1 = document.getElementById("day1");

    const months1 = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    (function populateMonths1() {
        for (let i = 0; i < months1.length; i++) {
            const option = document.createElement('option');
            option.textContent = months1[i]; // Corrected variable name
            monthSelect1.appendChild(option);
        }
        monthSelect1.value = "January";
    })();

    function populateDays1(month1) {
        while (daySelect1.firstChild) {
            daySelect1.removeChild(daySelect1.firstChild);
        }

        let dayNum1;

        if (month1 === 'January' || month1 === 'March' || month1 === 'May'
            || month1 === 'July' || month1 === 'August'
            || month1 === 'October' || month1 === 'December') {
            dayNum1 = 31;
        } else if (month1 === 'April' || month1 === 'June'
            || month1 === 'September' || month1 === 'November') {
            dayNum1 = 30;
        }

        for (let i = 1; i <= dayNum1; i++) {
            const option = document.createElement("option");
            option.textContent = i;
            daySelect1.appendChild(option);
        }
    }

    function populateYears1() {
        let year1 = new Date().getFullYear();
        for (let i = 0; i < 101; i++) {
            const option = document.createElement("option");
            option.textContent = year1 - i;
            yearSelect1.appendChild(option);
        }
    }

    populateDays1(monthSelect1.value);
    populateYears1();
</script>

<script>
$("#saveButton").click(function() {
    // Gather input values
    const title = $("#title").val();
    const meterialUsed = $("#meterialUsed").val();
    const category = $("#category").val();
    const chapterName = $("#chapterName").val();
    const typeOfQuestion = $("#typeOfQuestion").val();
    const timeLimit = $("#timeLimit").val();
    const startDate = $("#year").val() + "-" + $("#month").val() + "-" + $("#day").val();
    const endDate = $("#year1").val() + "-" + $("#month1").val() + "-" + $("#day1").val();
    const queLimitToDisplay = $("#queLimitToDisplay").val();
    const score = $("#score").val();
    const note = $("#note").val();

    // Construct data object
    const materialData = {
        title: title,
        meterialUsed: meterialUsed,
        category: category,
        chapterName: chapterName,
        typeOfQuestion: typeOfQuestion,
        timeLimit: timeLimit,
        startDate: startDate,
        endDate: endDate,
        queLimitToDisplay: queLimitToDisplay,
        score: score,
        note: note
    };

    // Send AJAX request to save data
    $.ajax({
        url: "/saveAddMaterial",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(materialData),
        success: function(response) {
            alert(response); // Alert response message
            window.location.href = "addmaterial"; // Redirect after success
        },
        error: function(error) {
            alert("Failed to save Material Details"); // Error message
        }
    });
});

</script>

</body>
</html>