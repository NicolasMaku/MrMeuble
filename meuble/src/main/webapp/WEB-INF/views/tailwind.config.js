/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./*.jsp",
    "./template/*.jsp",
    "./accueil/*.jsp",
    "./login/*.jsp",
    '../../node_modules/preline/dist/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Quicksand'],
      },
    },
  },
  plugins: [
    require('preline/plugin'),
    require('daisyui'),
  ],
}
