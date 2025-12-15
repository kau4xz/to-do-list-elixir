/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "../lib/*_web.ex",
    "../lib/*_web/**/*.*ex",
    "./js/**/*.js"
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require("daisyui")
  ],
}
