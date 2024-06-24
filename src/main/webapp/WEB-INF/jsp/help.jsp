<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>input</title>

    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      .help-support-main-div {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
      }

      .help-support-heading {
        width: 100%;
        padding: 30px;
        text-align: center;
      }

      .help-support-heading > h1 {
        font-weight: 600;
        font-size: 2.8rem;
        color: #282c3f;
        position: relative;
        z-index: 1;
      }

      .input-main-container {
        width: 80%;
        margin: auto;
        box-shadow: 0px 0px 9px 0px #55d0ff;
        border-radius: 10px;
      }

      .input-main-container:hover {
        width: 80%;
        margin: auto;
        box-shadow: 0px 0px 22px 0px #55d0ff;
        border-radius: 10px;
      }

      .input-name-number-main-div {
        width: 100%;
        padding: 20px;
      }

      .name-heading {
        width: 80%;
        padding: 2px 10px;
        margin: auto;
      }

      .name-heading > h3 {
        font-weight: 600;
        font-size: 1.5rem;
      }

      .input-name-number-div {
        width: 100%;
        display: flex;
        justify-content: space-around;
        align-items: center;
        padding: 5px 0;
      }

      .input-container {
        position: relative;
        margin-top: 20px;
        width: 30%;
      }

      .input-container input {
        width: 100%;
        padding: 20px 7px;
        font-size: 20px;
        font-weight: 500;
        border-radius: 4px;
        outline: none;
        background: none;
      }

      .input-container label {
        position: absolute;
        top: 10px;
        left: 10px;
        color: #282c3f;
        font-size: 15px;
        font-weight: 600;
        font-family: sans-serif;
        transition: all 0.2s;
        pointer-events: none;
        background-color: white;
        padding: 5px;
      }

      .input-container input:focus + label,
      .input-container input:not(:placeholder-shown) + label {
        top: -8px;
        left: 10px;
        font-size: 15px;
        font-weight: 600;
        color: #282c3f;
        padding-left: 5px;
        padding-right: 5px;
      }

      .input-container input:focus {
        box-shadow: 1px 3px 0px 3px #9adee3;
      }

      .input-mail-main-div {
        width: 100%;
        padding: 20px 0;
      }

      .mail-heading {
        width: 80%;
        padding: 4px 0;
        margin: auto;
      }

      .mail-heading > h3 {
        font-weight: 600;
        font-size: 1.5rem;
      }

      .input-mail-div {
        width: 100%;
        padding: 1% 0;
        display: flex;
        justify-content: space-around;
        align-items: center;
      }

      .submit-div {
        width: 100%;
        padding: 1.5%;
        text-align: center;
      }

      .submit-div button {
        width: 10%;
        border: none;
        outline: none;
        padding: 0.8% 0;
        border-radius: 5px;
        cursor: pointer;
        background-color: #55d0ff;
        position: relative;
        overflow: hidden;
      }

      #green {
        width: 100%;
        height: 100%;
        background-color: #5ed7df;
        border-left: 0;
        border-right: 0;
        position: absolute;
        top: 0;
        left: -100%;
        transition: left 0.6s ease;
      }

      .submit-div button:hover #green {
        left: 0;
      }

      .submit-div button:hover {
        box-shadow: 0px 2px 10px 1px #9adee3;
      }

      .submit-div button h5 {
        font-family: sans-serif;
        font-weight: 400;
        color: white;
        font-size: 14px;
        position: relative;
        z-index: 99;
      }

      @media (max-width: 1000px) {
        * {
          text-align: center;
        }

        .input-1,
        .input-2 {
          width: 90%;
        }

        .input-name-number-div {
          display: flex;
          flex-direction: column;
          padding: 0;
        }

        .help-support-heading {
          width: 100%;
          text-align: center;
        }

        .input-container {
          position: relative;
          margin-top: 20px;
          width: 80%;
        }

        .input-container input {
          width: 100%;
          padding: 15px;
          font-size: 20px;
          font-weight: 500;
          border: 5px solid #282c3f;
          border-radius: 4px;
          outline: none;
          background: none;
        }

        .input-container label {
          position: absolute;
          top: 10px;
          left: 10px;
          color: #282c3f;
          font-size: 16px;
          font-weight: 800;
          font-family: sans-serif;
          transition: all 0.2s;
          pointer-events: none;
          background-color: white;
          padding: 0 5px;
        }

        .input-container input:focus + label,
        .input-container input:not(:placeholder-shown) + label {
          top: -8px;
          left: 10px;
          font-size: 16px;
          font-weight: 900;
          padding-left: 5px;
          padding-right: 5px;
        }

        .input-mail-div {
          width: 100%;
          padding: 1% 0;
          display: flex;
          flex-direction: column;
          justify-content: space-around;
          align-items: center;
        }

        .submit-div button {
          width: 50%;
          padding: 1% 0;
          font-size: 1.2rem;
          font-weight: 900;
          cursor: pointer;
          border-radius: 5px;
          margin-bottom: 20px;
        }
      }

      @media (max-width: 379px) {
        .custom-underline::after {
          display: none;
        }
      }
    </style>
  </head>

  <body>
    <jsp:include page="sidenav.jsp"></jsp:include>
    <section id="content">
      <jsp:include page="header.jsp"></jsp:include>
      <main>
        <div class="help-support-main-div">
          <div class="help-support-heading">
            <h1><span class="custom-underline">Help & Support</span></h1>
          </div>

          <div class="input-main-container">
            <div class="input-name-number-main-div">
              <div class="name-heading">
                <h3>Add contact number</h3>
              </div>

              <div class="input-name-number-div">
                <div class="input-container">
                  <input type="text" id="input" placeholder=" " required />
                  <label for="input">Add Name</label>
                </div>

                <div class="input-container">
                  <input type="text" id="input" placeholder=" " required />
                  <label for="input">Add Number</label>
                </div>
              </div>

              <div class="input-name-number-div">
                <div class="input-container">
                  <input type="text" id="input" placeholder=" " required />
                  <label for="input">Add Name</label>
                </div>

                <div class="input-container">
                  <input type="text" id="input" placeholder=" " required />
                  <label for="input">Add Number</label>
                </div>
              </div>
            </div>

            <div class="input-mail-main-div">
              <div class="mail-heading">
                <h3>Add Contact mail ID</h3>
              </div>

              <div class="input-mail-div">
                <div class="input-container">
                  <input type="email" id="input" placeholder=" " required />
                  <label for="input">Mail ID</label>
                </div>

                <div class="input-container">
                  <input type="email" id="input" placeholder=" " required />
                  <label for="input">Mail ID</label>
                </div>
              </div>
            </div>
          </div>

          <div class="submit-div">
            <button type="button" class="save-btn">
              <h5>Save</h5>
              <div id="green"></div>
            </button>
          </div>
        </div>
      </main>
    </section>
  </body>
</html>
