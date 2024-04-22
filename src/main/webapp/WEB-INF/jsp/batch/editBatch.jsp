<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Add Batch</title>
        <link rel="stylesheet" href="css/admin.css">
        <script src="https://kit.fontawesome.com/ae73087723.js" crossorigin="anonymous"></script>
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
                    <h1 style="margin-bottom: 30px; text-align: center; font-weight: 600; font-size: 30px">UPDATE
                        BATCH</h1>
                    <div class="container2" style="margin-left: 20px; margin-right: 20px">
                        <!-- 					<div style="display: flex; flex-direction: column;"> -->
                        <!-- 						<label style="font-size: 13px; margin-bottom: 7px">Enter -->
                        <!-- 							Batch</label> <input id="" name="" type="text" required="required" -->
                        <!-- 							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"> -->
                        <!-- 					</div> -->
                        <input type="hidden" id="id" name="id">
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Select
                                Course</label> <select id="course" name="course"
                                style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8;">
                                <option>Select</option>
                                <!-- 							<option>Permission</option> -->
                                <!-- 							<option>Roles</option> -->
                            </select>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
                                Batch Name</label> <input id="batchName" name="batchName" type="text"
                                required="required"
                                style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
                                Batch Demo Date</label> <input id="batchDemoDate" name="batchDemoDate" type="date"
                                required="required"
                                style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
                                Batch Start Date</label> <input id="batchStartDate" name="batchStartDate" type="date"
                                required="required"
                                style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
                                Batch End Date</label> <input id="batchEndDate" name="batchEndDate" type="date"
                                required="required"
                                style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
                                Classes Days</label> <input id="classesDay" name="classesDay" type="text"
                                required="required"
                                style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
                                Assign Teacher Name</label> <input id="teacher" name="teacher" type="text"
                                required="required"
                                style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
                                Batch Fee</label> <input id="batchFees" name="batchFees" type="text" required="required"
                                style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8">
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <label style="font-size: 13px; font-weight: 500; margin-bottom: 7px">Enter
                                Zoom Details</label> <textarea id="zoomDetails" name="zoomDetails" type="text"
                                required="required"
                                style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"></textarea>
                        </div>
                        <!-- 					<div style="display: flex; flex-direction: column;"> -->
                        <!-- 						<label style="font-size: 13px; margin-bottom: 7px">Add -->
                        <!-- 							Students</label> <input id="" name="" type="text" required="required" -->
                        <!-- 							style="padding: 10px; border-radius: 5px; border: 1px solid #bfb8b8"> -->
                        <!-- 					</div> -->
                    </div>
                    <div style="display: flex; justify-content: center; gap: 50px; margin-top: 30px">
                        <button
                            style="cursor: pointer; font-size: 14px; font-weight: 700; background-color: #59f7f1; color: #ffffff; border-radius: 5px; padding: 15px; width: 100px; border: none"
                            id="saveButton">Update</button>

                    </div>
                </div>
            </main>
        </section>
        <script src="js/adminscript.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var batchId = getUrlParameter('id');

                if (batchId) {
                    getBatchDetails(batchId);
                } else {
                    alert("Batch ID is missing");
                }

                function getBatchDetails(id) {
                    $.ajax({
                        url: "getBatchesDataById/" + id,
                        type: "POST",
                        contentType: "application/json",
                        success: function (response) {
                            console.log("Response Data:", response);
                            if (response) {
                                populateForm(response); // Just pass the response directly
                            } else {
                                alert("No batch data found");
                            }
                        },
                        error: function (error) {
                            alert("Failed to fetch batch data");
                        }
                    });
                }

                function populateForm(batch) {
                    $("#id").val(batch.id);
                    $("#course").val(batch.course);
                    $("#batchName").val(batch.batchName);
                    $("#batchDemoDate").val(batch.batchDemoDate);
                    $("#batchStartDate").val(batch.batchStartDate);
                    $("#batchEndDate").val(batch.batchEndDate);
                    $("#classesDay").val(batch.classesDay);
                    $("#teacher").val(batch.teacher);
                    $("#batchFees").val(batch.batchFees);
                    $("#zoomDetails").val(batch.zoomDetails);
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
            $(document).ready(function () {

                $("#saveButton").click(function () {
                    var id = $("#id").val();
                    var course = $("#course").val();
                    var batchName = $("#batchName").val();
                    var batchDemoDate = $("#batchDemoDate").val();
                    var batchStartDate = $("#batchStartDate").val();
                    var batchEndDate = $("#batchEndDate").val();
                    var classesDay = $("#classesDay").val();
                    var teacher = $("#teacher").val();
                    var batchFees = $("#batchFees").val();
                    var zoomDetails = $("#zoomDetails").val();


                    var batchData = {
                        id: id,
                        course: course,
                        batchName: batchName,
                        batchDemoDate: batchDemoDate,
                        batchStartDate: batchStartDate,
                        batchEndDate: batchEndDate,
                        classesDay: classesDay,
                        teacher: teacher,
                        batchFees: batchFees,
                        zoomDetails: zoomDetails
                    };

                    $.ajax({
                        url: "editBatches/" + id,
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(batchData),
                        success: function (response) {
                            alert(response);
                            window.location.href = "batches";
                        },
                        error: function (error) {
                            alert("Failed to Update Batch Details");
                        }
                    });
                });


                function getCourseData() {
                    $.ajax({
                        type: "get",
                        contentType: "application/json",
                        url: 'getCourses',
                        async: false,
                        success: function (response) {
                            var appenddata1 = "";
                            for (var i = 0; i < response.data.length; i++) {
                                appenddata1 += "<option value='" + response.data[i].courses + "'>" + response.data[i].courses + "</option>";
                            }
                            $("#course").append(appenddata1);
                        },
                        error: function () {
                            alert("Failed to fetch courses");
                        }
                    });
                }

                getCourseData();
            });
        </script>


    </body>

    </html>