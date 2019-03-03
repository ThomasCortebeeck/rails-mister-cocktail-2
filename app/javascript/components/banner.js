// app/javascript/components/banner.js
import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Change your life", "By drinking cocktails"],
    typeSpeed: 100,
    loop: true
  });
};

export { loadDynamicBannerText };