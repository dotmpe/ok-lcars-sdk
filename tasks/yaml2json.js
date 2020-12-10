'use strict';

// Just copied the yaml2json bits from grunt-convert, which is getting stale.
// https://github.com/doowb/grunt-convert/blob/master/tasks/convert.js

 module.exports = function(grunt) {

  var fs = require('fs');
  var path = require('path');
  var async = require('async');
  var yaml = require('js-yaml');

  grunt.registerMultiTask('yaml2json', 'Convert format', function(src) {

    var done = this.async();
    async.forEach(this.files, function (f, next) {

      var handled = false;
      var finish = function() {
        if(!handled) {
          // Write the destination file.
          grunt.file.write(f.dest, data);
          next();
        }
      };

      if (f.src.length < 1) {
        // No src files, issued warn and goto next target.
        grunt.log.warn('Destination not written because no source files were found.');
        next();
        return;
      }

      var srcFiles = f.src.map(grunt.file.read).join(grunt.util.normalizelf(grunt.util.linefeed)),
          srcExt = path.extname(f.src[0]),
          destExt = path.extname(f.dest),
          data = srcFiles;

      if (srcExt === '.yml' || srcExt === '.yaml') {

        if (fs.statSync(f.src[0]).mtime < fs.statSync(f.dest).mtime) {
          grunt.log.debug('File ' + f.dest.cyan + ' is newer than source.');
          next();
          return;
        }

        try {
          data = JSON.stringify(yaml.safeLoad(fs.readFileSync(f.src[0], 'utf8')));
        }
        catch (e) {
          grunt.fail.warn('File ' + f.dest.cyan + ' parsing error: ' + e.message);
        }
      }

      finish();
      // Print a success message.
      grunt.log.ok('File ' + f.dest.cyan + ' converted.' + ' OK'.green);
    }, done);
  });
};
