gulp = require('gulp')
$ = require('gulp-load-plugins')(lazy: true)
browserSync = require('browser-sync')
stylish = require('jshint-stylish')

onError = (error) ->
	$.notify.onError('ERROR: <%- error.plugin %>') error
	$.util.beep()
	$.util.log '======= ERROR. ========\n'
	$.util.log error
	
gulp.task 'coffee-watch', ->
	gulp.src([
		'src/coffee/**/**/*.coffee'
	])
		.pipe $.plumber(errorHandler: onError)
		.pipe($.order([
			'**/plugins/*'
			'**/app.coffee'
		]))
		.pipe $.concat('app.js')
		.pipe $.accord('coffee-script')
		.pipe $.jshint()
		.pipe $.jshint.reporter(stylish)
		.pipe gulp.dest './app/js'

gulp.task('coffee', ['coffee-watch'], browserSync.reload);