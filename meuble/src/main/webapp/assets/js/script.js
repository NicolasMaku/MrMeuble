document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll('*').forEach(element => {
        element.style.visibility = 'visible';
    });
    
    gsap.from(".slogan", {
        y: 75,
        opacity: 0,
        duration: 1,
        delay: 1,
    })           
    gsap.from(".bgs", {
         y: 800,
         duration: 1.2
     });
    gsap.from('.navbar', {
        opacity: 0,
        delay: 1.3,
        duration: 0.5
    });
    gsap.from('.list', {
        opacity: 0,
        delay: 1.6,
        duration: 0.5,
        stagger: 0.2
    })
    gsap.from('.illustration', {
        opacity: 0,
        delay: 1.5,
        duration: 1.7,
        stagger: {
            each: 0.3,
            from: 'center'
        }
    }),
    gsap.from('.goToTable', {
        opacity: 0,
        delay: 1.5,
        duration: 1
    })
});