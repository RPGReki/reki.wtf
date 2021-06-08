var gulp = require('gulp'),
    request = require('request'),
    fs = require('fs'),
    md5 = require('md5'),
    config = require('dotenv').config();

var buildSrc = "./";

gulp.task("get-comments", function (done) {

    // set up the request with appropriate auth token and Form ID
    var url = `https://api.netlify.com/api/v1/forms/${process.env.COMMENT_FORM_ID}/submissions/?access_token=${process.env.API_AUTH}`;

    // get the data from Netlify's submissions API
    request(url, function(err, response, body){
        if(!err && response.statusCode === 200){
            console.log("Submissions found");
            var body = JSON.parse(body);
            var comments = {};

            // shape the data
            for(var item in body){
                var data = body[item].data;

                var comment = {
                    name: data.name,
                    url: data.url,
                    gravatar: md5(data.email),
                    message: data.message,
                    slug: data.slug,
                    date: body[item].created_at
                };

                // Add it to an existing array or create a new one
                if(comments[data.slug]){
                    comments[data.slug].push(comment);
                } else {
                    comments[data.slug] = [comment];
                }
            }

            // write our data to a file where Jekyll can get it.
            fs.writeFile(buildSrc + "site/_data/comments.json", JSON.stringify(comments, null, 2), function(err) {
                if(err) {
                    console.log(err);
                    done();
                } else {
                    console.log("Comments data saved.");
                    done();
                }
            });

        } else {
            console.log("Couldn't get comments from Netlify");
            done();
        }
    });
});

gulp.task("get-poll-referral", function (done) {

    // set up the request with appropriate auth token and Form ID
    var url = `https://api.netlify.com/api/v1/forms/${process.env.POLL_ID_REFERRAL}/submissions/?access_token=${process.env.API_AUTH}`;

    // get the data from Netlify's submissions API
    request(url, function(err, response, body){
        if(!err && response.statusCode === 200){
            console.log("Submissions found");
            var body = JSON.parse(body);
            var poll = [];

            // shape the data
            for(var item in body){
                var data = body[item].data;

                var vote = {
                    referrer: data.vote,
                    date: body[item].created_at
                };

                poll.push(vote);
            }

            // write our data to a file where Jekyll can get it.
            fs.writeFile(buildSrc + "site/_data/polls/referral.json", JSON.stringify(poll, null, 2), function(err) {
                if(err) {
                    console.log(err);
                    done();
                } else {
                    console.log("Poll data saved.");
                    done();
                }
            });

        } else {
            console.log("Couldn't get poll from Netlify");
            done();
        }
    });
});