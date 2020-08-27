const toggle = document.querySelector('.top_toogle');
const menu = document.querySelector('.top_menu');
const login = document.querySelector('.login');

toggle.addEventListener('click', () => {
	menu.classList.toggle('active');
	login.classList.toggle('active');
});




