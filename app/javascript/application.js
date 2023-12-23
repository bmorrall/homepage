// Entry point for the build script in your package.json

import Rails from '@rails/ujs'

// jQuery is required by Bootstrap's JavaScript.
import jQuery from 'jquery'

import '../../vendor/javascripts/bootstrap/alert'

import './analytics'
import './layout'
import './pages'
Rails.start()
window.jQuery = window.$ = jQuery
