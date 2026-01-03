var gulp = require('gulp'),
    request = require('request'),
    purgecss = require('gulp-purgecss'),
    argv = require('minimist')(process.argv.slice(2));
var buildSrc = "./";

gulp.task('purgecss', () => {
  return gulp.src('docs/assets/2021/css/*.css')
    .pipe(purgecss({
        content: ['docs/**/*.html', 'docs/.dev/**/*.html']
    }))
    .pipe(gulp.dest('docs/assets/2021/css/purged/'))
})
