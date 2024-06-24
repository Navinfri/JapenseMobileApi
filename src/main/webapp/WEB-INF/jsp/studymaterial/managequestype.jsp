<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />

    <title>Manage Question Type</title>
    <link rel="stylesheet" href="css/admin.css" />

    <script
      src="https://kit.fontawesome.com/ae73087723.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <style>
    .Container {
      width: 100%;
      height: 100vh;
      margin-top: 50px;
    }

    .container2 {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr 1fr;
    }

    .TableContainer {
      margin-top: 20px;
      background: #fff;
      border-radius: 7px;
      border: 1.5px solid #e8e8e8;
      padding: 20px;
      cursor: pointer;
      overflow: scroll;
    }

    .MainTable {
      border-collapse: collapse;
      text-align: center;
      overflow: hidden;
      cursor: pointer;
      width: 100%;
    }

    .tableheading {
      border-bottom: 1px solid rgb(208, 208, 208);
      background-color: #36454f;
    }

    .tableheading th {
      padding: 1rem;
      text-transform: capitalize;
      letter-spacing: 0.1rem;
      font-size: 0.9rem;
      font-weight: 600;
      color: rgb(56, 56, 56);
      text-align: center;
    }

    .tablebody {
      padding: 1rem 1.8rem;
      font-weight: 500;
      font-size: 13.5px;
      text-align: center;
    }

    .iconmag {
      position: absolute;
      top: 12.5rem;
      right: 12rem;
    }
  </style>
  <body>
    <jsp:include page="../sidenav.jsp"></jsp:include>
    <section id="content">
      <jsp:include page="../header.jsp"></jsp:include>
      <main>
        <div class="Container">
          <h1
            style="
              margin-bottom: 30px;
              text-align: center;
              font-weight: 600;
              font-size: 30px;
            "
          >
            MANAGE QUESTION TYPE
          </h1>
          <div
            style="
              display: flex;
              justify-content: space-between;
              flex-wrap: wrap;
            "
          >
            <div style="margin-left: 20px"></div>
            <div style="margin-right: 20px">
              <div style="display: inline">
                <input
                  type="text"
                  placeholder="Search"
                  style="
                    background: none;
                    border: none;
                    border-bottom: 2px solid grey;
                    padding: 12px;
                  "
                />
                <span class="fa-solid fa-magnifying-glass iconmag"></span>
              </div>
              <a href="addcategory" style="margin-left: 20px">
                <button
                  style="
                    font-weight: 700;
                    font-size: 14px;
                    cursor: pointer;
                    background-color: #20d42c;
                    color: #ffffff;
                    border-radius: 5px;
                    padding: 12px;
                    border: none;
                  "
                >
                  <i style="margin-right: 5px" class="fa-solid fa-plus"></i>Add
                  Category
                </button>
              </a>
            </div>
          </div>
          <div class="TableContainer">
            <div class="tablestyle">
              <table class="MainTable">
                <thead class="tableheading">
                  <tr>
                    <th style="font-weight: 800; color: white">SrNo</th>
                    <th style="font-weight: 800; color: white">
                      Question Type
                    </th>
                    <th style="font-weight: 800; color: white">Action</th>
                  </tr>
                </thead>
                <tbody class="tablebody"></tbody>
              </table>
            </div>
          </div>
        </div>
      </main>
    </section>
    <script src="js/adminscript.js"></script>

    <script>
      $(document).ready(function () {
        fetchAllQuestion();

        function fetchAllQuestion() {
          $.ajax({
            url: "/JapaneseAdminWebApp/listAllQuestions",
            type: "GET",
            contentType: "application/json",
            success: function (response) {
              if (response && response.length > 0) {
                populateTable(response);
              } else {
                alert("No data found");
              }
            },
            error: function (xhr, status, error) {
              console.error("Failed to fetch category data:", error);
              alert("Failed to fetch category data");
            },
          });
        }

        function populateTable(typeOfQuestion) {
          var tableBody = $(".tablebody");
          tableBody.empty();

          typeOfQuestion.forEach(function (typeOfQuestion, index) {
            var row = $("<tr>");
            row.append($("<td>").text(index + 1));
            row.append($("<td>").text(typeOfQuestion.typeOfQuestion));

            var actionCell = $("<td>");

            var viewIcon = $("<i>")
              .addClass("fa-solid fa-eye")
              .attr("title", "View")
              .css("color", "#007BFF")
              .css("cursor", "pointer")
              .css("font-size", "18px")
              .css("font.width", "900")
			  .css("padding", "10px")
              .click(function () {
                viewQuestionDetails(typeOfQuestion.id);
              });

            var updateIcon = $("<i>")
              .addClass("fa-regular fa-pen-to-square")
              .attr("title", "Edit")
              .css("color", "#12e068")
              .css("cursor", "pointer")
              .css("font-size", "18px")
              .css("font.width", "900")
			  .css("padding", "10px")
              .click(function () {
                editQuestion(typeOfQuestion.id);
              });

            var deleteIcon = $("<i>")
              .addClass("fa-solid fa-trash")
              .css("color", "#eb070f")
              .attr("title", "Delete")
              .css("cursor", "pointer")
              .css("font-size", "18px")
              .css("font.width", "900")
			  .css("padding", "10px")
              .click(function () {
                deleteCategory(typeOfQuestion.id);
              });

            actionCell.append(viewIcon).append(" ");
            actionCell.append(updateIcon).append(" ");
            actionCell.append(deleteIcon);

            row.append(actionCell);

            tableBody.append(row);
          });
        }

        function viewQuestionDetails(id) {
          window.location.href = "viewQuestionType?id=" + id;
        }

        function editQuestion(id) {
          window.location.href = "editquestype?id=" + id;
        }

        function deleteCategory(id) {
          $.ajax({
            url: "/JapaneseAdminWebApp/deleteQueType/" + id,
            type: "DELETE",
            contentType: "application/json",
            success: function (response) {
              if (response) {
                alert(response);
                fetchAllQuestion();
              } else {
                alert(response);
              }
            },
            error: function (xhr, status, error) {
              console.error("Failed to delete Question Type:", error);
              if (xhr.status === 403) {
                alert("YOU DON'T HAVE THE PERMISSION");
              } else {
                alert("Failed to communicate with the server");
              }
            },
          });
        }
      });
    </script>
  </body>
</html>
