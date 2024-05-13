<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Question Type</title>
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
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">UPDATE
					QUESTION TYPE</h1>
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
					<input type="hidden" id="id" name="id">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
							Type Of Questions</label> <input id="typeOfQuestion" name="typeOfQuestion" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8">
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
					<button id="saveButton"
						style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Update</button>
					
				</div>
			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
	<script type="text/javascript">
    $(document).ready(function() {
        var questionId = getUrlParameter('id');

        if (questionId) {
            getQuestionType(questionId);
        } else {
            alert("Question Type ID is missing");
        }

        function getQuestionType(id) {
            $.ajax({
                url: "/JapaneseAdminWebApp/questionFindById/" + id,
                type: "GET",
                contentType: "application/json",
                success: function(response) {
                    console.log("Response Data:", response);
                    if (response) {
                        populateForm(response);
                    } else {
                        alert("No Question Type found");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Failed to fetch Question Type:", error);
                    if (xhr.status === 403) {
                        alert("YOU DON'T HAVE THE PERMISSION");
                    } else {
                        alert("Failed to communicate with the server");
                    }
                }

            });
        }

        function populateForm(question) {
            $("#id").val(question.id);
            $("#typeOfQuestion").val(question.typeOfQuestion);
        }

        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        }
    });
</script>

	<script>
    $(document).ready(function() {
        $("#saveButton").click(function() {
            var id = $("#id").val();
            var typeOfQuestion = $("#typeOfQuestion").val();
           
            var questionsData = {
                id: id,
                typeOfQuestion: typeOfQuestion
            };

            $.ajax({
                url: "/JapaneseAdminWebApp/upadateQueType",
                type: "PUT", 
                contentType: "application/json",
                data: JSON.stringify(questionsData),
                success: function(response) {
                    alert(response);
                    window.location.href = "managequestype";
                },
                error: function(xhr, status, error) {
                    console.error("Failed to Save Question Type:", error);
                    if (xhr.status === 403) {
                        alert("YOU DON'T HAVE THE PERMISSION");
                    } else {
                        alert("Failed to communicate with the server");
                    }
                }

            });
        });
    });
</script>

</body>
</html>