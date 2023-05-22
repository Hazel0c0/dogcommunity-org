
const menuBtn = document.querySelector('header .menu-open');
const closeBtn = document.querySelector('.gnb .close');

const gnb = document.querySelector('.gnb');


menuBtn.addEventListener('click', () => {
    gnb.classList.add('on');
});

closeBtn.addEventListener('click', () => {
    gnb.classList.remove('on');
});