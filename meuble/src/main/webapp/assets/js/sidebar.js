const sideBar = document.querySelector(".sidebar");
let firstTime = true;
const miafina = document.querySelectorAll('.miafina');

sideBar.addEventListener('mouseover', (e) => {
    if (firstTime) {
        firstTime = false;
        return;
    }
    sideBar.style.width = "180px";
        miafina.forEach(elem => {
            elem.style.display = "block";
            // elem.style.transition = "all 0.5s ease"
        });
});

sideBar.addEventListener('mouseout', (e) => {
    miafina.forEach(elem => {
        elem.style.display = "none";
    });
    sideBar.style.width = "50px";
});