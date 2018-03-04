var gulp = require('gulp');
var path = require('path');
var less = require('gulp-less');
var concat = require('gulp-concat');
var minifyCSS = require('gulp-clean-css');
var lessPluginAutoPrefix = require('less-plugin-autoprefix');
var autoprefix = new lessPluginAutoPrefix({
  browsers: ["last 2 versions"]
});
var imagemin = require('gulp-imagemin');


// Watching paths
var paths = {
  less: ['src/less/**/*.less']
};

gulp.task('default', ['less', 'fonts', 'images']);

gulp.task('develop', ['default', 'watch']);

gulp.task('watch', function() {
  // main task
  gulp.watch(paths.less, ['less']);
});

gulp.task('less', function() {
  // main task
  return gulp.src('./src/less/main.less')
    .pipe(less({
      plugins: [autoprefix]
    }))
    .pipe(minifyCSS())
    .pipe(concat('main.min.css'))
    .pipe(gulp.dest('./myblog/staticfiles/css'));
});

gulp.task('images', function() {
  return gulp.src('src/img/*')
    .pipe(imagemin())
    .pipe(gulp.dest('./myblog/staticfiles/img'));
});

gulp.task('fonts', function() {
  gulp.src('./node_modules/font-awesome/fonts/**/*.{ttf,woff,woff2,eof,svg}')
    .pipe(gulp.dest('./myblog/staticfiles/css/fonts'));
});
