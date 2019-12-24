var gulp = require('gulp');
var clean = require('gulp-clean');
var minifyCSS = require('gulp-clean-css');
let replace = require('gulp-replace');
let htmlmin = require('gulp-htmlmin');
var autoprefixer = require('gulp-autoprefixer');
var merge = require('merge-stream');

// Location to our files
var globs = {
  dist: './dist',
  css: './src/css/**/*.css',
  html: './src/*.html',
  images: './src/assets/**',
  manifest: './src/manifest.json'
};

// First clean the dist folder, it will delete it and recreate it
gulp.task('clean', gulp.series(function() {
  return gulp.src(globs.dist, {read: false})
    .pipe(clean());
}));

// Move images to /dist folder
// You can also perform scaling and compression on images
gulp.task('assets', gulp.series('clean', function() {
  var images = gulp.src(globs.images).pipe(gulp.dest(globs.dist + '/assets'));
  var manifest = gulp.src(globs.manifest).pipe(gulp.dest(globs.dist + '/'));

  return merge(images);
}));

// Take all CSS in /css folder -> Add auto prefixer to them
// Then Minify and export to /dist folder
gulp.task('styles', gulp.series('clean', function() {
  return gulp.src(globs.css)
    .pipe(autoprefixer())
    .pipe(minifyCSS())
    .pipe(gulp.dest(globs.dist + '/css'));
}));

// Take the HTML file, minify it with params below
gulp.task('html', gulp.series('clean', function() {
  return gulp.src(globs.html)
  .pipe(htmlmin({
    collapseWhitespace: true,
    removeComments: true
  }))
  .pipe(gulp.dest('./dist'));
}));

// Build the task
gulp.task('build', gulp.parallel('assets', 'styles', 'html'));

gulp.task('default', gulp.series('build'));
