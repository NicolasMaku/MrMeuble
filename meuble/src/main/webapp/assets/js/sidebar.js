const sideBar = document.querySelector(".sidebar");
let firstTime = true;

sideBar.addEventListener('mouseover', (e) => {
    if (firstTime) {
        firstTime = false;
        return;
    }
    sideBar.style.width = "135px";
    console.log("ato o");
});

sideBar.addEventListener('mouseout', (e) => {
    console.log("bye zozo");
    sideBar.style.width = "50px";
});