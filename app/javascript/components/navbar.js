function changeNavbarOnScroll() {
	const navbar = document.querySelector(".navbar-wagon")
	window.addEventListener("scroll", () => {
		console.log("sauda")
        if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-wagon-white');
      } else {
        navbar.classList.remove('navbar-wagon-white');
      }

	});
}

export { changeNavbarOnScroll } 