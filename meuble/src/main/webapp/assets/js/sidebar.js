const sideBar = document.querySelector(".sidebar");
let firstTime = true;
const miafina = document.querySelectorAll('.miafina');

sideBar.addEventListener('mouseover', (e) => {
    if (firstTime) {
        firstTime = false;
        return;
    }
    sideBar.style.width = "280px";
        miafina.forEach(elem => {
            elem.style.display = "flex";
            elem.style.alignItems = "center";
            // elem.style.transition = "all 0.5s ease"
        });
});

sideBar.addEventListener('mouseout', (e) => {
    miafina.forEach(elem => {
        elem.style.display = "none";
    });
    sideBar.style.width = "60px";
});