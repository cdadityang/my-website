var gulp = require('gulp');
var clean = require('gulp-clean');
const purgecss = require('gulp-purgecss')
var minifyCSS = require('gulp-clean-css');
let replace = require('gulp-replace');
let htmlmin = require('gulp-htmlmin');
var autoprefixer = require('gulp-autoprefixer');
var merge = require('merge-stream');

// Location to our files
var globs = {
  build: './build',
  css: './src/css/**/*.css',
  html: './src/*.html',
  images: './src/assets/**',
  fonts: './src/fonts/**',
  manifest: './src/manifest.json'
};

// First clean the build folder, it will delete it and recreate it
gulp.task('clean', gulp.series(function() {
  return gulp.src(globs.build, {read: false})
    .pipe(clean());
}));

// Move images, fonts to /build folder
// Move manifest.json to /build folder
// You can also perform scaling and compression on images
gulp.task('assets', gulp.series('clean', function() {
  var images = gulp.src(globs.images, { encoding: false }).pipe(gulp.dest(globs.build + '/assets'));
  var fonts = gulp.src(globs.fonts).pipe(gulp.dest(globs.build + '/fonts'));
  var manifest = gulp.src(globs.manifest).pipe(gulp.dest(globs.build + '/'));

  return merge(images);
}));

// Take all CSS in /css folder -> Add auto prefixer to them
// Then Minify and export to /build folder
gulp.task('styles', gulp.series('clean', function() {
  return gulp.src(globs.css)
    .pipe(autoprefixer())
    .pipe(purgecss({
      content: [globs.html]
    }))
    .pipe(minifyCSS())
    .pipe(gulp.dest(globs.build + '/css'));
}));

// Take the HTML file, minify it with params below
gulp.task('html', gulp.series('clean', function() {
  return gulp.src(globs.html)
  .pipe(htmlmin({
    collapseWhitespace: true,
    removeComments: true
  }))
  .pipe(gulp.dest('./build'));
}));

// Build the task
gulp.task('build', gulp.parallel('assets', 'styles', 'html'));

gulp.task('default', gulp.series('build'));
