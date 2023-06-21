
function openTab(event, tabName) {
  var i, tabcontent, tablinks;

  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  document.getElementById(tabName).style.display = "block";
  event.currentTarget.className += " active";
}

document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("tablink-groups").click();
});


const groupsTab = document.getElementById("tablink-groups");
groupsTab.addEventListener("click", (event) => {
  openTab(event, "Groups");
});

const eventsTab = document.getElementById("tablink-events");
eventsTab.addEventListener("click", (event) => {
  openTab(event, "Events");
});

const pinsTab = document.getElementById("tablink-pins");
pinsTab.addEventListener("click", (event) => {
  openTab(event, "Pins");
});
