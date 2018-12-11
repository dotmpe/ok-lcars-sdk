module.exports = function(grunt) {

	grunt.loadNpmTasks('grunt-sass-lint');
	grunt.loadNpmTasks('grunt-puglint');
	grunt.loadNpmTasks('grunt-json-validate');

	grunt.initConfig({
		//jsonvalidate: {
		//	target: {
		//		files: [
		//			{
		//				//options: { },
		//				schema: 'node_modules/package.json-schema/v1/schema.json',
		//				//refs: [
		//				//	'path/to/referenced/**/*.schema.json'
		//				//],
		//				src: 'package.json'
		//			}
		//		]
		//	}
		//},
		puglint:{
			src: ['app/**.pug']
		},
		sasslint: {
			options: {
				//configFile: 'config/.sass-lint.yml',
				//formatter: 'junit',
				//outputFile: 'report.xml'
			},
			target: ['app/sdk-demo/\*.scss', 'app/sdk-demo/\*/\*.scss']
		}
	});

	grunt.registerTask('default', ['sasslint','puglint']);
	grunt.registerTask('test', 'default');
}
