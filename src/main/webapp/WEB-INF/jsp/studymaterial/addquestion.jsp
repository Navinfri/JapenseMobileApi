<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question Type</title>
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
				<div class="container2"
					style="margin-left: 20px; margin-right: 20px">
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Description</label> <textarea id="" name="" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Question</label> <textarea id="" name="" type="text" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Option 1</label> <textarea id="" name="" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Option 2</label> <textarea id="" name="" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Option 3</label> <textarea id="" name="" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add
							Option 4</label> <textarea id="" name="" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
					<div>
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Upload
							Image</label> <label for="input-file"> <input
							type="file"
							style="border: none; padding: 8px; border-radius: 5px;"
							accept="image/*" id="input-file">
						</label>
					</div>
					<div>
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Upload
							Audio</label> <label for="input-file"> <input
							type="file"
							style="border: none; padding: 8px; border-radius: 5px;"
							accept="audio/*" id="input-file">
						</label>
					</div>
					<div>
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Upload
							File</label> <label for="input-file"> <input
							type="file"
							style="border: none; padding: 8px; border-radius: 5px;"
							accept="file/*" id="input-file">
						</label>
					</div>
					<div style="display: flex; flex-direction: column;">
						<label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Add Correct
							Answer</label> <textarea id="" name="" required="required"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
					<button
						style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Add</button>
					<a href="manageaddquestion">
						<button
							style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #12e068; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Manage</button>
					</a>
				</div>
			</div>
		</main>
	</section>
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
</body>
</html>