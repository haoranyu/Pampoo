var gulp = require('gulp');
var uglify = require('gulp-uglify');
var browserify = require('browserify');
var buffer = require('vinyl-buffer');
var del = require('del');
var source = require('vinyl-source-stream');
var gutil = require('gulp-util');
var coffeeify = require('coffeeify');
var paths = {
  scripts: 'assets/js/',
};

// Not all tasks need to use streams
// A gulpfile is just another node program and you can use any package available on npm
gulp.task('clean', function() {
  // You can use multiple globbing patterns as you would with `gulp.src`
  return del(['build']);
});

gulp.task('scripts', ['clean'], function() {
  // Minify and copy all JavaScript (except vendor scripts)
  // with sourcemaps all the way down
  return browserify(paths.scripts + 'pampoo.coffee')
          .transform(coffeeify)
          .on('error', gutil.log)
          .bundle()
          .pipe(source('pampoo.min.js'))
          .pipe(buffer())
          .pipe(uglify())
          .pipe(gulp.dest('build/js'));
});

// Rerun the task when a file changes
gulp.task('watch', function() {
  gulp.watch(paths.scripts, ['scripts']);
});

gulp.task('default', ['watch', 'scripts']);
