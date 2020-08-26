const toggle = document.querySelector('.top_toogle');
const menu = document.querySelector('.top_menu');
const logins = document.querySelector('.login');

toggle.addEventListener('click', () => {
	menu.classList.toggle('active');
	logins.classList.toggle('active');
});







