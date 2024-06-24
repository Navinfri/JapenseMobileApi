<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Questions</title>
<link rel="stylesheet" href="css/admin.css">
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

#drop-area{
    width: 500px;
    height: 370px;
    padding: 30px 60px;
    background: #fff;
    text-align: center;
    border-radius: 20px;
    display: flex;
    align-items: center;
}

.img-view{
    width: 100%;
    height: 100%;
    border-radius: 20px;
    border: 2px dashed #bbb5ff;
    background: #f7f8ff;
    cursor: pointer;
    background-position: center;
    background-size: cover;
}

.img-view img{
    width: 100px;
    margin-top: 25px;
}

.img-view span{
    display: block;
    font-size: 12px;
    margin-top: 15px;
    color: #777;

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
					QUESTION</h1>
					<form id="questionForm" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="questionPaperId" name="questionPaperId"  value="${questionPaperId}">
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Description</label> <textarea id="description" name="description" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Question</label> <textarea id="textQuestion" name="textQuestion" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Option 1</label> <textarea id="answer1" name="answer1" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Option 2</label> <textarea id="answer2" name="answer2" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Option 3</label> <textarea id="answer3" name="answer3" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Option 4</label> <textarea id="answer4" name="answer4" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div>
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Upload
							Image</label> <label for="input-file"> <input
							type="file"
							style="border: none; padding: 8px; border-radius: 5px;"
							accept="image/*" id="imageFile" name="imageFile">
						</label>
					</div>
					<div>
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Upload
							Audio</label> <label for="input-file"> <input
							type="file"
							style="border: none; padding: 8px; border-radius: 5px;"
							accept="audio/*" id="audioFile" name="audioFile">
						</label>
					</div>
					<div>
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Upload
							File</label> <label for="input-file"> <input
							type="file"
							style="border: none; padding: 8px; border-radius: 5px;"
							accept="file/*" id="genericFile" name="genericFile">
						</label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add Correct
							Answer</label> <textarea id="correctAnswer" name="correctAnswer" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
				</div>
				 <div style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
            <button id="nextBtn" type="button" style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Next</button>
            <button id="addBtn" type="button" style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Add</button>
            <button id="finishBtn" type="button" style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #ff6363; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Finish</button>
            <a href="manageaddquestion">
                <button type="button" style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #12e068; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Manage</button>
            </a>
        </div>
				 </form>
			</div>
		</main>
	</section>
	<script src="js/adminscript.js"></script>
	<script src="js/adminscript.js"></script>
<script>
    const dropArea = document.getElementById("drop-area");
    const inputFile = document.getElementById("input-file");
    const imgView = document.getElementById("img-view");

    inputFile.addEventListener("change", uploadImage);

    function uploadImage() {
        let imgLink = URL.createObjectURL(inputFile.files[0]);
        imgView.style.backgroundImage = `url(${imgLink})`
        imgView.textContent = "";
        imgView.style.border = 0
    }

    dropArea.addEventListener("dragover", function(e) {
        e.preventDefault()
    })

    dropArea.addEventListener("drop", function(e) {
        e.preventDefault()
        inputFile.files = e.dataTransfer.files;
        uploadImage()
    })


</script>

   <script>
//    $(document).ready(function () {
// 	    // Function to save form data and redirect
// 	    function saveFormDataAndRedirect() {
// 	        var questionPaperId = $('[name="questionPaperId"]').val();
// 	        var formData = new FormData($('#questionForm')[0]);
// 	        formData.append('questionPaperId', questionPaperId);
	        
// 	        $.ajax({
// 	            type: 'POST',
// 	            url: 'saveAddQuestions',
// 	            data: formData,
// 	            processData: false,
// 	            contentType: false,
// 	            success: function (response) {
// 	                console.log('Data saved successfully:', response);
// 	                 window.location.href = '/addQuestion?questionPaperId=' + encodeURIComponent(questionPaperId);
// 	            },
// 	            error: function (xhr, status, error) {
// 	                console.error('Error saving data:', error);
// 	            }
// 	        });
// 	    }

// 	    // Event listener for form submission
// 	    $('#questionForm').submit(function (event) {
// 	        event.preventDefault(); // Prevent default form submission
// 	        saveFormDataAndRedirect(); // Call the function to save form data and redirect
// 	    });

// 	    // Event listener for button click
// 	    $('#nextBtn').click(function () {
// 	        saveFormDataAndRedirect(); // Call the same function to save form data and redirect
// 	    });
// 	});


    </script>
    
    
  <script>
    $(document).ready(function() {
        // Handle Next button click
        $('#nextBtn').click(function(event) {
            event.preventDefault();
            clearFormExceptQuestionPaperId();
            redirectToSamePageWithQuestionPaperId();
        });

        // Handle Add button click
        $('#addBtn').click(function(event) {
            event.preventDefault();
            submitForm('add');
        });

        // Handle Finish button click
        $('#finishBtn').click(function(event) {
            event.preventDefault();
            finishQuestionPaper();
        });

        function submitForm(action) {
            var form = $('#questionForm')[0];
            var data = new FormData(form);

            // Add action to the form data
            data.append('action', action);

            $.ajax({
                url: 'saveAddQuestions',
                type: 'POST',
                enctype: 'multipart/form-data',
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success: function(response) {
                    alert(response);
                    if (action === 'finish') {
                        alert("Question paper finished.");
                        incrementQuestionPaperId();
                        redirectToSamePageWithQuestionPaperId();
                    }
                },
                error: function(xhr, status, error) {
                    console.log(xhr.responseText);
                }
            });
        }

        function finishQuestionPaper() {
            alert("Question paper finished.");
            incrementQuestionPaperId();
            redirectToSamePageWithQuestionPaperId();
        }

        function getQuestionPaperId() {
            // Retrieve the current question paper ID from the hidden input field
            var questionPaperId = $('#questionPaperId').val();
            return questionPaperId;
        }

        function incrementQuestionPaperId() {
            // Increment the question paper ID (could be done server-side and returned in the response)
            var currentId = parseInt($('#questionPaperId').val(), 10);
            var newId = currentId + 1;
            $('#questionPaperId').val(newId);
        }

        function clearFormExceptQuestionPaperId() {
            // Clear all form fields except for questionPaperId
            $('#questionForm').find(':input').not('#questionPaperId').val('');
        }

        function redirectToSamePageWithQuestionPaperId() {
            var questionPaperId = getQuestionPaperId();
            var redirectUrl = "addquestion?questionPaperId=" + questionPaperId;
            window.location.href = redirectUrl;
        }
    });
</script>


</body>
</html>