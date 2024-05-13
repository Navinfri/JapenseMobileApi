<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Material</title>
<link rel="stylesheet" href="css/admin.css">
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
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

        .container3 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 30px;
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
            width: 500px;
            text-align: center;
        }

        .tableheading {
            border-bottom: 1px solid rgb(208, 208, 208);
            background-color: #36454f;
            text-align: center;
        }

        .tableheading th {
            padding: 1rem;
            text-transform: capitalize;
            letter-spacing: 0.1rem;
            font-size: 0.9rem;
            font-weight: 600;
            color: rgb(56, 56, 56);
        }

        .tablebody tr {
            font-weight: 500;
            font-size: 13.5px;
            text-align: left;
        }

        tbody tr:nth-child(even) {
            background: white
        }

        tbody tr:nth-child(odd) {
            background: #0000000b
        }
    </style>

<body>
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main>
			<div>
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">VIEW
					STUDY MATERIAL</h1>
					 <input type="hidden" id="id" name="id">
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Title</label> <label id="title" name="title" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8;"></label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Material Used For</label> <label id="meterialUsed" name="meterialUsed"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8;">
							
						</label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Course</label> <label id="course" name="course"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8;">
						</label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Category</label> <label id="category" name="category"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8;">	
						</label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">Add
							Chapter Name</label> <label id="chapterName" name="chapterName" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8"></label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Type of Question</label> <label id="typeOfQuestion" name="typeOfQuestion"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8;">
							
							
						</label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Set Time Limit</label> <label id="timeLimit" name="timeLimit" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8"></label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Start Date</label> 
							<div style="display: flex;">
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="day" id="day"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="month" id="month"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="year" id="year"></label>
                                </div>
                            </div>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							End Date</label> 
							<div style="display: flex;">
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="day1" id="day1"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="month1" id="month1"></label>
                                </div>
                                <div>
                                    <label
                                        style="padding: 13px; border-radius: 5px; background-color: none; border: none; border-bottom: 1px solid #bfb8b8"
                                        name="year1" id="year1"></label>
                                </div>
                            </div>					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Limit to Display</label> <label id="queLimitToDisplay" name="queLimitToDisplay" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8"></label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Total Score of Question </label> <label id="score" name="score" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8"></label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 900; margin-bottom: 7px">
							Note</label> <label id="note" name="note" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: none; border-bottom: 1px solid #bfb8b8"></label>
					</div>
				</div>
				
			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript">
            $(document).ready(function () {
                var materialId = getUrlParameter('id');

                if (materialId) {
                    getMaterialDetails(materialId);
                } else {
                    alert("Material ID is missing");
                }

                function getMaterialDetails(id) {
                    $.ajax({
                        url: "/JapaneseAdminWebApp/findMaterialById/" + id,
                        type: "GET",
                        contentType: "application/json",
                        success: function (response) {
                            //console.log("Response Data:", response);
                            if (response) {
                                populateForm(response);

                            } else {
                                alert("No batch data found");
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

                function populateForm(material) {
                   // Check if all fields are present in the batch object
                    document.getElementById("id").innerText = material.id;
                    document.getElementById("title").innerText = material.title;
                    document.getElementById("meterialUsed").innerText = material.meterialUsed;
                    document.getElementById("course").innerText = material.course;
                    document.getElementById("category").innerText = material.category;
                    document.getElementById("chapterName").innerText = material.chapterName;
                    document.getElementById("typeOfQuestion").innerText = material.typeOfQuestion;
                    document.getElementById("timeLimit").innerText = material.timeLimit;
                   
                    $("#startDate").val(material.startDate);
                    $("#endDate").val(material.endDate);
                   
                    document.getElementById("queLimitToDisplay").innerText = material.queLimitToDisplay;
                    document.getElementById("score").innerText = material.score;
                    document.getElementById("note").innerText = material.note;

                    // Call displayDates function to set the date dropdown values
                    displayDates(material.startDate, material.endDate);

                   
                }



                function displayDates(startDate, endDate) {
                    // Split the date strings into day, month, and year
                    var startDateParts = startDate.split("-");
                    var endDateParts = endDate.split("-");
                    

                    // Set the selected options for demo date
                    document.getElementById("day").innerText = startDateParts[2];
                    document.getElementById("month").innerText = startDateParts[1];
                    document.getElementById("year").innerText = startDateParts[0];

                    // Set the text content for start date
                    document.getElementById("day1").innerText = endDateParts[2];
                    document.getElementById("month1").innerText = endDateParts[1];
                    document.getElementById("year1").innerText = endDateParts[0];

                   
                }



                function getUrlParameter(name) {
                    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                    var results = regex.exec(location.search);
                    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
                }
            });


        </script>


</body>
</html>