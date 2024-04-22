// Sidebar DropDown

const allDropDown = document.querySelectorAll('#sidebar .side-dropdown');
const sidebar = document.getElementById("sidebar")


allDropDown.forEach(item => {
  const a = item.parentElement.querySelector('a:first-child');
  // console.log(a)
  a.addEventListener('click', function (e) {
    e.preventDefault()

    if (!this.classList.contains('active')) {
      allDropDown.forEach(i => {
        const aLink = i.parentElement.querySelector('a:first-child');
        aLink.classList.remove('active')
        i.classList.remove('show')
      })
    }

    this.classList.toggle('active')
    item.classList.toggle('show')
  })
})



sidebar.addEventListener('mouseleave', function () {
  if (this.classList.contains('hide')) {
    allDropDown.forEach(item => {
      const a = item.parentElement.querySelector('a:first-child');
      a.classList.remove('active')
      item.classList.remove('show')
    })
  }
})


const profile = document.querySelector('.navcont .profile');
const imgProf = profile.querySelector('.profimg')
const dropdownProfile = profile.querySelector('.profile-link')

imgProf.addEventListener('click', function (e) {
  e.stopPropagation(); // Prevent the click event from propagating to the window
  dropdownProfile.classList.toggle('show');
  // Hide the message dropdown if it's open
  const message = document.querySelector('.navcont .message');
  const dropdownMsg = message.querySelector('.msg-link');
  if (dropdownMsg.classList.contains('show')) {
    dropdownMsg.classList.remove('show');
  }
});



// Sidebar Collaspse
const toggleSidebar = document.querySelector('.navcont .toggle-sidebar');

toggleSidebar.addEventListener('click', function () {
  sidebar.classList.toggle('hide')
})


// Scroll navbar box shadow
var navbar = document.querySelector('.navcont');

// Function to toggle the 'scrolled' class based on scroll position
function toggleNavbarShadow() {
  if (window.scrollY > 0) {
    navbar.classList.add('scrolled');
  } else {
    navbar.classList.remove('scrolled');
  }
}

// Add scroll event listener to window
window.addEventListener('scroll', toggleNavbarShadow);

// Initial check in case the page is already scrolled when loaded
toggleNavbarShadow();

const selectBtn = document.querySelector(".select-btn"),
  items = document.querySelectorAll(".item");

selectBtn.addEventListener("click", () => {
  selectBtn.classList.toggle("open");
})

items.forEach((item => {
  item.addEventListener("click", () => {
    item.classList.toggle("checked");

    let checked = document.querySelectorAll(".checked"),
      btnText = document.querySelector(".btn-text")

    if (checked && checked.length > 0) {
      btnText.innerText = `${checked.length} Selected`;
    } else {
      btnText.innerText = "Select Permission";
    }
  });

}));
