const toggle = document.querySelector('.top_toogle');
const menu = document.querySelector('.top_menu');
const login01 = document.querySelector('.login01');

toggle.addEventListener('click', () => {
	menu.classList.toggle('active');
	login01.classList.toggle('active');
});




