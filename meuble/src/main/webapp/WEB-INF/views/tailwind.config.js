/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "*.html",
    'node_modules/preline/dist/*.js',
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Quicksand']
      }
    },
  },
  plugins: [
    require('preline/plugin')
  ],
}

