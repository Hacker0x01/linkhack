// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "jquery"
import "bootstrap"

// Add jQuery to global scope for legacy code
window.jQuery = jQuery;
window.$ = jQuery;

console.log('Hello World from Importmap')