// Entry point for the build script in your package.json

import Rails from "@rails/ujs"
Rails.start()

// jQuery is required by Bootstrap's JavaScript.
import jQuery from "jquery"
window.jQuery = window.$ = jQuery

import "../../vendor/javascripts/jquery.raptorize.1.1"

import "../../vendor/javascripts/bootstrap/alert"

import "./analytics"
import "./layout"
import "./pages"
