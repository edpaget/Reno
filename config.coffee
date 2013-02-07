exports.config =
  paths:
    public: 'public'

  files:
    javascripts:
      defaultExtension: 'coffee'
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/
        'test/javascripts/test.js': /^test(\/|\\)(?!vendor)/
        'test/javascripts/test-vendor.js': /^test(\/|\\)(?=vendor)/
      order:
        before: [
          'vendor/scripts/console-helper.js',
          'vendor/scripts/jquery-1.8.3.js',
          'vendor/scripts/underscore.js',
          'vendor/scripts/backbone.js',
          'vendor/scripts/backbone-mediator.js',


          # Test Libraries
          'test/vendor/scripts/mocha-1.4.2.js',
          'test/vendor/scripts/chai.js',
          'test/vendor/scripts/sinon-1.4.2.js',
          'test/vendor/scripts/sinon-chai-2.1.2.js',
          'test/vendor/scripts/chai-jquery'
        ]

    stylesheets:
      defaultExtension: 'styl'
      joinTo: 
        'stylesheets/app.css' : /^app\/styles\/index.styl/ 
        'stylesheets/vendor.css' : /^vendor/
        'test/stylesheets/test.css': /^test/
      order:
       before: ['vendor/styles/bootstrap.css']

    templates:
      defaultExtension: 'eco'
      joinTo: 'javascripts/app.js'
