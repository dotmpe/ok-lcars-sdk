module.exports = function(grunt) {

	grunt.loadNpmTasks('grunt-sass-lint');
	grunt.loadNpmTasks('grunt-puglint');
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-jsonlint');

	grunt.loadTasks('tasks');

	grunt.initConfig({
		puglint: {
      files: [ 'app/**/*.pug' ]
		},
		sasslint: {
			options: {
			  files: {
			    // FIXME: old sasslint does not like new style interpolated vars
			    ignore: "app/ok-sdk/style/style.sass"
        },
        rules: {
          "placeholder-in-extend": 0
        }
			},
			target: ['app/ok-sdk/\*.sass', 'app/ok-sdk/\*/\*.sass']
		},
    jshint: { files: ['Gruntfile.js'] },
    jsonlint: {
      default: {
        src: ['package.json']
      }
    },
    yaml2json: {
      convert: {
        files: [ {
          expand: true,
          cwd: 'var/ok-sdk/',
          src: '**/*.yaml',
          dest: 'var/ok-sdk/',
          ext: '.json'
        } ]
      }
    }
	});

	grunt.registerTask('lint', ['sasslint', 'puglint', 'jsonlint']);
	grunt.registerTask('build', ['yaml2json']);
	grunt.registerTask('default', ['lint', 'build']);
	grunt.registerTask('test', 'default');
};
