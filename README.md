# Team Hub

## Tools

* [Angular](https://angularjs.org/) - FE framework
* [CoffeeScript](http://coffeescript.org/) - compiles to javascript
* [Cucumber](https://cucumber.io/) - feature test framework
* [Firebase](https://www.firebase.com/) - BE service
* [Gulp](http://gruntjs.com/) and [Browserify](http://browserify.org/) - asset compilation
* [Jade](http://jade-lang.com/) - compiles to html
* [Mocha](http://mochajs.org/) - unit test framework
* [Stylus](http://learnboost.github.io/stylus/) - compiles to css

## Setup

* `npm install`

## View in a browser

* `gulp serve` serves `app/` on `localhost:8080`

## Development

* `gulp watch` serves `app/` on `localhost:8080` and recompiles on changes

## Deployment

* `gulp build` creates a `dist/` folder which can be used for deployment

## Testing

* `npm test`
  * `npm run lint`
    * `npm run lint-coffeescript`
    * `npm run lint-stylus`
  * `npm run unit-test`
  * `npm run feature-test`

See the scripts in `package.json` for the actual commands run by each.
