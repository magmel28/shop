// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

var ready;
ready = function () {
    $('#q').bind('change input paste',function(){
        var val = $(this).val()

        $.get( "/search_suggestions?query="+val, function( data ) {
            $('#results').empty();
            $('#results').show();
            $.each(data, function( index, result ) {

                $('#results').append("<li>"+result+"</li>");

                $('#results li').hover(function(){
                    var chosen_value = $(this).text();
                    $('.search-form input[type="text"]').val(chosen_value);
                });
                var chosen_value;
                $('#results li').click(function(){
                    chosen_value = $(this).text();
                    $('.search-form input[type="text"]').val(chosen_value);
                    $('#results').empty().hide();
                });
                $('.submit-inside-input').click(function() {
                    window.location.href = '/products?query=' + chosen_value;
                    return false;
                });
            });
            //if (typeof (val) == 'undefined' || val = null) {
            //    $('#results').hide();
            //}
        });
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);