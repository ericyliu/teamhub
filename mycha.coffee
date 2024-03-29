module.exports =

  # Environment variables to add to process.env when running mocha
  mochaEnv: {}

  # Default options to pass to mocha (can be overriden by command line options)
  mochaOptions:
    colors: yes
    compilers: 'coffee:coffee-script/register'
    reporter: 'dot'

  # Path patten used for finding tests (see https://github.com/isaacs/minimatch)
  testFilePattern: 'app/**/*_spec.coffee'

  # Files to include before all tests
  testHelpers: [
    'spec/spec_helper.coffee'
  ]
