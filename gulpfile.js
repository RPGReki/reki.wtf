var gulp = require('gulp'),
    request = require('request'),
    purgecss = require('gulp-purgecss'),
    fs = require('fs'),
    md5 = require('md5'),
    config = require('dotenv').config(),
    argv = require('minimist')(process.argv.slice(2));

var buildSrc = "./";

gulp.task("get-comments", function (done) {

    // set up the request with appropriate auth token and Form ID
    var url = `https://gitlab.com/api/v4/projects/27243899/issues/3/notes?private_token=${process.env.GITLAB_TOKEN}&per_page=100`;

    var comments = {};

    fs.readFile(buildSrc + "site/_data/saved-comments.json", 'utf8', (err, data) => {
        comments = JSON.parse(data);
    });

    // get the data from Netlify's submissions API
    request(url, function(err, response, body){
        if(!err && response.statusCode === 200){
            argv.silent || console.log("Submissions found");
            var body = JSON.parse(body);

            // shape the data
            for(var item in body){
                try {
                    var data = JSON.parse(body[item].body);

                    var comment = {
                        slug: data.slug,
                        date: body[item].created_at,
                        name: data.name,
                        url: data.url,
                        gravatar: md5(data.email),
                        message: data.message
                    };

                    // Add it to an existing array or create a new one
                    if(comments[data.slug]){
                        comments[data.slug].push(comment);
                    } else {
                        comments[data.slug] = [comment];
                    }
                } catch (e) {
                    continue;
                }
            }

            // write our data to a file where Jekyll can get it.
            fs.writeFile(buildSrc + "site/_data/comments.json", JSON.stringify(comments, null, 2), function(err) {
                if(err) {
                    console.log(err);
                    done();
                } else {
                    argv.silent || console.log("Comments data saved.");
                    done();
                }
            });

        } else {
            console.log("Couldn't get comments from Netlify");
            done();
        }
    });
});

gulp.task('purgecss', () => {
  return gulp.src('docs/assets/2021/css/*.css')
    .pipe(purgecss({
        content: ['docs/**/*.html', 'docs/.dev/**/*.html']
    }))
    .pipe(gulp.dest('docs/assets/2021/css/purged/'))
})
