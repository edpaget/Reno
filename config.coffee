exports.config =
  # Edit the next line to change default build path.
  paths:
    public: 'public'

  files:
    javascripts:
      defaultExtension: 'js'
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/
        'test/javascripts/test.js': /^test(\/|\\)(?!vendor)/
        'test/javascripts/test-vendor.js': /^test(\/|\\)(?=vendor)/
      order:
        before: [
          'vendor/scripts/console-helper.js',
          'vendor/scripts/jquery-1.7.2.js',
          'vendor/scripts/underscore-1.3.1.js',
          'vendor/scripts/backbone-0.9.2.js',
          'vendor/scripts/backbone-mediator.js',

          # Twitter Bootstrap jquery plugins
          'vendor/scripts/bootstrap/bootstrap-transition.js',
          'vendor/scripts/bootstrap/bootstrap-alert.js',
          'vendor/scripts/bootstrap/bootstrap-button.js',
          'vendor/scripts/bootstrap/bootstrap-carousel.js',
          'vendor/scripts/bootstrap/bootstrap-collapse.js',
          'vendor/scripts/bootstrap/bootstrap-dropdown.js',
          'vendor/scripts/bootstrap/bootstrap-modal.js',
          'vendor/scripts/bootstrap/bootstrap-tooltip.js',
          'vendor/scripts/bootstrap/bootstrap-popover.js',
          'vendor/scripts/bootstrap/bootstrap-scrollspy.js',
          'vendor/scripts/bootstrap/bootstrap-tab.js',
          'vendor/scripts/bootstrap/bootstrap-typeahed.js'

          # Test Libraries
          'test/vendor/scripts/mocha-1.4.2.js',
          'test/vendor/scripts/chai.js',
          'test/vendor/scripts/sinon-1.4.2.js',
          'test/vendor/scripts/sinon-chai-2.1.2.js',
          'test/vendor/scripts/chai-jquery'
        ]

    stylesheets:
      defaultExtension: 'less'
      joinTo: 
        'stylesheets/app.css' : /^app/
        'stylesheets/vendor.css' : /^vendor/
        'test/stylesheets/test.css': /^test/
      order:
       before: ['vendor/styles/bootstrap/bootstrap.less']

    templates:
      defaultExtension: 'hbs'
      joinTo: 'javascripts/app.js'

  # Change this if you're using something other than backbone (e.g. 'ember').
  # Content of files, generated with `brunch generate` depends on the setting.
  # framework: 'backbone'

  # Settings of web server that will run with `brunch watch [--server]`.
  # server:
  #   # Path to your server node.js module.
  #   # If it's commented-out, brunch will use built-in express.js server.
  #   path: 'server.coffee'
  #   port: 3333
  #   # Run even without `--server` option?
  #   run: yes
