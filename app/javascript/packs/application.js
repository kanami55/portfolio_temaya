// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

window.$ = window.jQuery = require('jquery');
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
// import '@fortawesome/fontawesome-free/js/all'
import "../stylesheets/users"
import "../stylesheets/homes"
import "../stylesheets/admin/users"

require('packs/raty')
require('packs/custom')

Rails.start()
Turbolinks.start()
ActiveStorage.start()


