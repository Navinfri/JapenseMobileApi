<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Role</title>
<link rel="stylesheet" href="css/admin.css">
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
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

.select2-checkbox {
    margin-right: 8px;
}

.select2-checkbox {
    margin-right: 8px;
}
</style>
<body onload="getTeacher(); getCourse(); getBatch();">
	<jsp:include page="../sidenav.jsp"></jsp:include>
	<section id="content">
		<jsp:include page="../header.jsp"></jsp:include>
		<main class="mainCont">
			<div>
				<h1
					style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">CREATE
					ROLE</h1>
				<input type="hidden" name="uniqueId" id="uniqueId">
				<div class="container2">
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 14px; font-weight: 500; margin-bottom: 7px">Select
							Teacher</label> <select id="teacher" name="teacher"
							style="padding: 8px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Teacher</option>
							<!-- <option>Permission</option>
							<option>Roles</option> -->
						</select>
					</div>
					<!-- <div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 14px; font-weight: 500; margin-bottom: 7px">Select
							Course</label> <select id="courses" name="courses"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Course</option>
							<option>Permission</option>
							<option>Roles</option>
						</select>
					</div> -->
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 14px; font-weight: 500; margin-bottom: 7px">Select
							Course</label> <select id="courses" name="courses" multiple
							style="width: padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<!-- Options will be populated dynamically -->
						</select>
					</div>
					<!-- <div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 14px; font-weight: 500; margin-bottom: 7px">Select
							Batch</label> <select id="batchName" name="batchName"
							style="padding: 13px; border-radius: 5px; border: 1px solid #bfb8b8;">
							<option>Select Batch</option>
							<option>Permission</option>
							<option>Roles</option>
						</select>
					</div> -->
					<div style="display: flex; flex-direction: column;">
						<label
							style="font-size: 14px; font-weight: 500; margin-bottom: 7px">Select
							Batch</label> <select id="batchName" name="batchName[]" multiple
							style="width: 100%;">
							<!-- Options will be populated dynamically -->
						</select>
					</div>
				</div>
				<div style="margin-top: 30px;">
					<label
						style="font-size: 14px; font-weight: 500; margin-bottom: 25px">Select
						Permission</label>
					<div
						style="display: flex; justify-content: space-around; flex-wrap: wrap; margin-top: 20px;">
						<div>
							<input type="checkbox" style="width: 17px; height: 17px;" name="permissions" id="permission1" 
							value="Category"/> <label
								style="font-size: 14px; font-weight: 500; background: none">Category</label>
						</div>
						<div>
							<input type="checkbox" style="width: 17px; height: 17px;" name="permissions" id="permission2" 
							value="Type Of Question"/> <label
								style="font-size: 14px; font-weight: 500; background: none">Type Of Question</label>
						</div>
						<div>
							<input type="checkbox" style="width: 17px; height: 17px;" name="permissions" id="permission3"
							 value="Study Material(Questions)"/> <label
								style="font-size: 14px; font-weight: 500; background: none">Study Material(Questions)
								</label>
						</div>
						<div>
							<input type="checkbox" style="width: 17px; height: 17px;" name="permissions" id="permission4"
							value="Material(Question)-Info"/> <label
								style="font-size: 14px; font-weight: 500; background: none">Material(Question)-Info</label>
						</div>
						<div>
							<input type="checkbox" style="width: 17px; height: 17px;" name="permissions" id="permission5"
							value="Add Questions"/> <label
								style="font-size: 14px; font-weight: 500; background: none">Add Questions</label>
						</div>
					</div>
				</div>
				<div
					style="margin-top: 50px; display: flex; justify-content: center; gap: 50px;">
					<!-- <button
						style="cursor: pointer; font-weight: 700; font-size: 14px; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none" id="saveBtn">Save</button> -->
					<button
						style="cursor: pointer; font-weight: 700; font-size: 14px; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none"
						id="saveBtn" onclick="updateRole()">Save</button>
					<a href="managecreaterole">
						<!-- <button
							style="cursor: pointer; font-weight: 700; font-size: 14px; background-color: #12e068; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none">Manage</button> -->
					</a>
				</div>
			</div>
		</main>
	</section>
	<script type="text/javascript">
	function getTeacher() {
	    $.ajax({
	        type: "get",
	        contentType: "application/json",
	        url: 'getAllTeacher',
	        async: true,  // Make it asynchronous
	        success: function(response) {
	            var appenddata1 = "";
	            for (var i = 0; i < response.data.length; i++) {
	                appenddata1 += "<option data-uniqueId='" + response.data[i].uniqueId + "' value='" + response.data[i].firstName + " " + response.data[i].lastName + "'>"
	                        + response.data[i].firstName
	                        + " "
	                        + response.data[i].lastName
	                        + "</option>";
	            }
	            $("#teacher").append(appenddata1);
	        },
	        error: function() {
	            alert("Failed to fetch teachers");
	        },
	        complete: function() {
	            // Capture change event of dropdown after options are populated
	            $("#teacher").change(function() {
	                var selectedTeacher = $(this).find("option:selected");
	                var uniqueId = selectedTeacher.data("uniqueid");  // Changed to lowercase 'id'
	                $("#uniqueId").val(uniqueId);  // Set the uniqueId value to the input field
	            });
	        }
	    });
	}

	function getCourse() {
	    $.ajax({
	        type: "get",
	        contentType: "application/json",
	        url: 'course',
	        async: false,
	        success: function(response) {
	            if (response && response.status === 'SUCCESS' && Array.isArray(response.data) && response.data.length > 0) {
	                var courses = response.data;
	                var selectOptions = [];

	                for (var i = 0; i < courses.length; i++) {
	                    selectOptions.push({id: courses[i].courses, text: courses[i].courses});
	                }

	                $("#courses").select2({
	                    data: selectOptions,
	                    templateResult: formatCourse
	                });
	            } else {
	                alert("No data found or invalid response structure for Courses");
	            }
	        },
	        error: function() {
	            alert("Failed to fetch courses");
	        }
	    });
	}

	function formatCourse(course) {
	    if (!course.id) {
	        return course.text;
	    }

	    var $course = $(
	        '<span><input type="checkbox" class="select2-checkbox" />' + course.text + '</span>'
	    );

	    return $course;
	}

	function getBatch() {
	    $.ajax({
	        type: "get",
	        contentType: "application/json",
	        url: 'getAllBatchesData',
	        async: false,
	        success: function(response) {
	            //console.log("Batches Response:", response);

	            if (Array.isArray(response) && response.length > 0) {
	                var batches = response;
	                var selectOptions = [];

	                for (var i = 0; i < batches.length; i++) {
	                    selectOptions.push({id: batches[i].batchName, text: batches[i].batchName});
	                }

	                $("#batchName").select2({
	                    data: selectOptions,
	                    templateResult: formatBatch
	                });
	            } else {
	                alert("No data found or invalid response structure for Batches");
	            }
	        },
	        error: function() {
	            alert("Failed to fetch batches");
	        }
	    });
	}

	function formatBatch(batch) {
	    if (!batch.id) {
	        return batch.text;
	    }

	    var $batch = $(
	        '<span><input type="checkbox" class="select2-checkbox" />' + batch.text + '</span>'
	    );

	    return $batch;
	}
	</script>
	<script>
	function updateRole() {
	    // Gather data from form fields
	    const uniqueId = document.getElementById('uniqueId').value;
	    const teacher = document.getElementById('teacher').value;
	    const courses = Array.from(document.getElementById('courses').selectedOptions).map(option => option.value);
	    const batchName = Array.from(document.getElementById('batchName').selectedOptions).map(option => option.value);
	    const permissions = Array.from(document.querySelectorAll('input[name="permissions"]:checked')).map(input => input.value);

	    // Create data object
	    const data = {
	        uniqueId,
	        teacher,
	        courses,
	        batchName,
	        permissions
	    };

	    // Send data to backend API using Fetch API
	    fetch('updateRole', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json',
	        },
	        body: JSON.stringify(data),
	    })
	    .then(response => {
	        if (!response.ok) {
	            throw new Error(`Server responded with status: ${response.status}`);
	        }
	        return response.json();
	    })
	    .then(data => {
	        // Handle success response
	        console.log('Success:', data);
	        if (data.success) {
	            alert(data.message || 'Teacher Role Saved Successfully');
	            window.location.reload(); // Reload the page after successful save
	        } else {
	            throw new Error(data.message || 'Error saving role');
	        }
	    })
	    .catch((error) => {
	        // Handle error
	        //console.error('Error:', error.message);
	        //alert(`Error: ${error.message}`);
	        alert(data.message || 'Teacher Role Saved Successfully');
            window.location.reload(); // Reload the page after successful save
	    });
	}
	</script>
	<script src="js/adminscript.js"></script>
</body>
</html>