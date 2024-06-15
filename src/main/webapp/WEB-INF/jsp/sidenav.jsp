<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/admin.css" />
    <script
      src="https://kit.fontawesome.com/ae73087723.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body onload="asideMenu()">
    <section id="sidebar">
      <div class="brandHead">
        <a href="/" class="brand" style="color: rgb(16, 8, 92)"
          ><img
            src="uploadfiles/logo2.png"
            style="width: 50px; margin-right: 10px"
          /><%=session.getAttribute("roleName")%></a
        >
      </div>
      <ul class="side-menu">
        <li id="SubUser">
          <a href="#" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i class="fa-solid fa-user icon"></i>Sub User
            <i class="fa-solid fa-caret-down icon-right"></i
          ></a>
          <ul class="side-dropdown">
            <li>
              <a
                href="manageuserlist"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i class="fa-solid fa-list" style="margin-right: 15px"></i>User
                List</a
              >
            </li>
            <!-- 					<li><a href="managecreaterole" -->
            <!-- 						style="color: rgb(16, 8, 92); font-weight: 500"><i -->
            <!-- 							class="fa-regular fa-user" style="margin-right: 15px"></i>Create -->
            <!-- 							Roles</a></li> -->
            <li>
              <a
                href="createuser"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i class="fa-solid fa-user-plus" style="margin-right: 15px"></i
                >Create User</a
              >
            </li>
          </ul>
        </li>
        <li id="Teacher">
          <a href="#" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i class="fa-solid fa-clipboard-list icon"></i>Teacher
            <i class="fa-solid fa-caret-down icon-right"></i
          ></a>
          <ul class="side-dropdown">
            <li>
              <a
                href="addteacher"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i class="fa-solid fa-plus" style="margin-right: 15px"></i
                >Create Teacher</a
              >
            </li>
            <li>
              <a
                href="manageteacher"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i class="fa-solid fa-cogs" style="margin-right: 15px"></i
                >Manage Teacher</a
              >
            </li>
            <li>
              <a
                href="rolespermission"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i class="fa-solid fa-person" style="margin-right: 15px"></i
                >Role/Permission</a
              >
            </li>
          </ul>
        </li>
        <li id="Student">
          <a href="#" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i class="fa-regular fa-user icon"></i>Student<i
              class="fa-solid fa-caret-down icon-right"
            ></i
          ></a>
          <ul class="side-dropdown">
            <li>
              <a
                href="addstudents"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i
                  class="fa-solid fa-person-circle-plus"
                  style="margin-right: 15px"
                ></i
                >Add Students</a
              >
            </li>
          </ul>
        </li>
        <li id="Course">
          <a href="#" style="color: rgb(16, 8, 92); font-weight: 500">
            <i class="fa-regular fa-book icon"></i>Course
            <i class="fa-solid fa-caret-down icon-right"></i
          ></a>
          <ul class="side-dropdown">
            <li>
              <a href="courses" style="color: rgb(16, 8, 92); font-weight: 500"
                ><i class="fa-solid fa-plus" style="margin-right: 15px"></i>Add
                Course
              </a>
            </li>
            <li>
              <a
                href="managecourse"
                style="color: rgb(16, 8, 92); font-weight: 500"
              >
                <i class="fa-solid fa-cogs" style="margin-right: 15px"></i
                >Manage Course</a
              >
            </li>
          </ul>
        </li>
        <li id="Batches">
          <a href="#" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i class="fa-solid fa-calendar-days icon"></i>Batches<i
              class="fa-solid fa-caret-down icon-right"
            ></i
          ></a>
          <ul class="side-dropdown">
            <li>
              <a href="batches" style="color: rgb(16, 8, 92); font-weight: 500"
                ><i
                  class="fa-solid fa-person-circle-plus"
                  style="margin-right: 15px"
                ></i
                >Add Batch</a
              >
            </li>
            <li>
              <a
                href="managebatch"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i
                  class="fa-solid fa-people-roof"
                  style="margin-right: 15px"
                ></i
                >Manage Batch</a
              >
            </li>
          </ul>
        </li>
        <li id="Subscription">
          <a href="subscription" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i
              class="fa-solid fa-cart-plus"
              style="margin-left: 12px; font-size: 15px"
            ></i
            ><span style="margin-left: 30px">Subscription</span></a
          >
        </li>
        <li id="StudyMaterial">
          <a href="#" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i class="fa-solid fa-user icon"></i>Study Material<i
              class="fa-solid fa-caret-down icon-right"
            ></i
          ></a>
          <ul class="side-dropdown">
            <li>
              <a
                href="addcategory"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i class="fa-solid fa-plus" style="margin-right: 15px"></i>Add
                Category</a
              >
            </li>
            <li>
              <a
                href="questiontype"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i class="fa-solid fa-book" style="margin-right: 15px"></i>Add
                Type of Question</a
              >
            </li>
            <li>
              <a
                href="addmaterial"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i
                  class="fa-solid fa-address-book"
                  style="margin-right: 15px"
                ></i
                >Add Study Material</a
              >
            </li>
            <li>
              <a
                href="addquestion"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i
                  class="fa-solid fa-address-book"
                  style="margin-right: 15px"
                ></i
                >Add Question
              </a>
            </li>
          </ul>
        </li>
        <li id="AllotmenttoStudyMaterial">
          <a href="#" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i class="fa-solid fa-user icon"></i>Allotment to Study Material
            <i class="fa-solid fa-caret-down icon-right"></i
          ></a>
          <ul class="side-dropdown">
            <li>
              <a href="addlist" style="color: rgb(16, 8, 92); font-weight: 500"
                ><i class="fa-solid fa-list" style="margin-right: 15px"></i>Add
                List</a
              >
            </li>
            <li>
              <a
                href="manageenroll"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i
                  class="fa-solid fa-bars-progress"
                  style="margin-right: 15px"
                ></i
                >Manage Enrolled Student</a
              >
            </li>
            <li>
              <a
                href="managesubs"
                style="color: rgb(16, 8, 92); font-weight: 500"
                ><i
                  class="fa-solid fa-people-roof"
                  style="margin-right: 15px"
                ></i
                >Manage Subscription Student</a
              >
            </li>
          </ul>
        </li>
        <li id="AttendanceofStudents">
          <a
            href="attendanceofstudents"
            style="color: rgb(16, 8, 92); font-weight: 500"
            ><i
              class="fa-solid fa-clipboard-user"
              style="margin-left: 12px; font-size: 15px"
            ></i
            ><span style="margin-left: 30px">Attendance of Students</span></a
          >
        </li>
        <li id="Enquiry">
          <a href="enquiry" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i
              class="fa-solid fa-phone"
              style="margin-left: 12px; font-size: 15px"
            ></i
            ><span style="margin-left: 30px">Enquiry</span></a
          >
        </li>
        <li id="Logs">
          <a href="logs" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i
              class="fa-solid fa-database"
              style="margin-left: 12px; font-size: 15px"
            ></i
            ><span style="margin-left: 30px">Logs</span></a
          >
        </li>
        <li id="Logs">
          <a href="help" style="color: rgb(16, 8, 92); font-weight: 500"
            ><i
              class="fa-solid fa-handshake-angle"
              style="margin-left: 12px; font-size: 15px"
            ></i
            ><span style="margin-left: 30px">Help & Support</span></a
          >
        </li>
      </ul>
    </section>
  </body>

  <script>

    function asideMenu(){

    	//alert("Side nav !!!")
    	// Get references to the <li> elements

    	var session = "<%=session.getAttribute("module")%>";

    	//alert(session)


    	const SubUser = document.getElementById('SubUser');
    	const Teacher = document.getElementById('Teacher');
    	const Student = document.getElementById('Student');

    	const Course = document.getElementById('Course');
    	const Batches = document.getElementById('Batches');
    	const Subscription = document.getElementById('Subscription');

    	const StudyMaterial = document.getElementById('StudyMaterial');
    	const AllotmenttoStudyMaterial = document.getElementById('AllotmenttoStudyMaterial');
    	const AttendanceofStudents = document.getElementById('AttendanceofStudents');

    	const Enquiry = document.getElementById('Enquiry');
    	const Logs = document.getElementById('Logs');





    	SubUser.style.display = 'none';
    	Teacher.style.display = 'none';
    	Student.style.display = 'none';

    	Course.style.display = 'none';
    	Batches.style.display = 'none';
    	Subscription.style.display = 'none';

    	StudyMaterial.style.display = 'none';
    	AllotmenttoStudyMaterial.style.display = 'none';
    	AttendanceofStudents.style.display = 'none';



    	Enquiry.style.display = 'none';
    	Logs.style.display = 'none';


    	if (session.includes("SubUser")) {
    		SubUser.style.display = 'block'; // Or use 'list-item' to display as a list item
    	}

    	if (session.includes("Teacher")) {
    		Teacher.style.display = 'block'; // Or use 'list-item' to display as a list item

    	}

    	if (session.includes("Student")) {
    		Student.style.display = 'block'; // Or use 'list-item' to display as a list item

    	}


    	if (session.includes("Course")) {
    		Course.style.display = 'block'; // Or use 'list-item' to display as a list item

    	}

    	if (session.includes("Batches")) {
    		Batches.style.display = 'block'; // Or use 'list-item' to display as a list item

    	}

    	if (session.includes("Subscription")) {
    		Subscription.style.display = 'block'; // Or use 'list-item' to display as a list item

    	}


    	if (session.includes("StudyMaterial")) {
    		StudyMaterial.style.display = 'block'; // Or use 'list-item' to display as a list item
    	}

    	if (session.includes("AllotmenttoStudyMaterial")) {
    		AllotmenttoStudyMaterial.style.display = 'block'; // Or use 'list-item' to display as a list item
    	}

    	if (session.includes("AttendanceofStudents")) {
    		AttendanceofStudents.style.display = 'block'; // Or use 'list-item' to display as a list item
    	}



    	if (session.includes("Enquiry")) {
    		Enquiry.style.display = 'block'; // Or use 'list-item' to display as a list item
    	}

    	if (session.includes("Logs")) {
    		Logs.style.display = 'block'; // Or use 'list-item' to display as a list item
    	}





    	//DashBoard
    	const totalEnrolledStudents = document.getElementById('totalEnrolledStudents');
    	const totalSubscriptionStudents = document.getElementById('totalSubscriptionStudents');
    	const noofTeachers = document.getElementById('noofTeachers');
    	const totalCourses = document.getElementById('totalCourses');
    	const totalBatches = document.getElementById('totalBatches');
    	const subscriptions = document.getElementById('subscriptions');

    	totalEnrolledStudents.style.display = 'none';
    	totalSubscriptionStudents.style.display = 'none';
    	noofTeachers.style.display = 'none';
    	totalCourses.style.display = 'none';
    	totalBatches.style.display = 'none';
    	subscriptions.style.display = 'none';


    	if (session.includes("Teacher")) {

    		noofTeachers.style.display = 'block';
    	}

    	if (session.includes("Student")) {

    		totalEnrolledStudents.style.display = 'block';
    		totalSubscriptionStudents.style.display = 'block';
    	}

    	if (session.includes("Course")) {

    		totalCourses.style.display = 'block';
    	}

    	if (session.includes("Batches")) {
    		totalBatches.style.display = 'block';
    	}

    	if (session.includes("Subscription")) {
    		totalSubscriptionStudents.style.display = 'block';
    		subscriptions.style.display = 'block';
    	}


    }
  </script>
</html>
