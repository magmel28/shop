$(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});

/* 
div class='hover-product-image'>
                            <div class='actions'>
                                <a href='img/products/dsquared.png' class='zoom-product' data-toggle='lightbox'>
                                    <i class='fa fa-search-plus'></i>
                                </a>
                                <a href='#' class='like-product'>
                                    <i class='fa fa-heart'></i>
                                </a>
                            </div>
                        </div>
 */

/* Знаю, что так не делается, сделал просто для демонстрации=) */
$('.popular-products-section .product-image').mouseenter(function(){
    var link_img = $(this).children("img").attr('src');
    $(this).append("<div class='hover-product-image'> \
                        <div class='actions'> \
                            <a href='" + link_img + "' class='zoom-product' data-toggle='lightbox'> \
                                <i class='fa fa-search-plus'></i> \
                            </a> \
                            <a href='#' class='like-product'> \
                                <i class='fa fa-heart'></i> \
                            </a> \
                         </div> \
                    </div>");
});
$('.product-image').mouseleave(function(){
    $(this).children('.hover-product-image').remove();
});


/* Disable animation if screen */
$( document ).ready(function() {
    if ($(window).width() < 768) {
        $('.category').removeClass("wow animated");
    }
});


/* Tooltip */
$('.get-promo').click(function(event){
    event.preventDefault();
    $('.get-promo-tooltip').show();
});
$('.close-get-promo-tooltip').click(function(){
    $('.get-promo-tooltip').hide();
});


/* Catalog list */
$( document ).ready(function() {
    $( ".categories-list .category-list-item label" ).click(function() {
      $(this).parent().next().slideToggle( "medium", function() {
        // Animation complete.
      });
    });
});

/* Adaptive catalog menu */



$( document ).ready(function(){
    $( ".mobile-btn" ).click(function() {
        var elementId = $(this).parent().attr('id') + '_list';
        $('#' + elementId).slideToggle( "medium" );
    });

    setTimeout(function(){
        $('#colors_list').hide();
    }, 100)
});

/*
$( document ).ready(function() {
    $('.sort-by a').click(function(){
       $(this).parent().prev().attr( 'checked', 'checked' );
    });
});

$(document).ready(function () {
    if (window.location.href.indexOf("sort=by_price_down") > -1) {
        $('.sort-by #by_price_down').attr( 'checked', 'checked' );
    }
    else if (window.location.href.indexOf("sort=by_price_up") > -1) {
        $('.sort-by #by_price_up').attr( 'checked', 'checked' );
    }
});
*/
var ready;
ready = function () {
    if (window.location.href.indexOf("sort=by_price_down") > -1) {
        $('.sort-by #by_price_down').attr( 'checked', 'checked' );
    }
    else if (window.location.href.indexOf("sort=by_price_up") > -1) {
        $('.sort-by #by_price_up').attr( 'checked', 'checked' );
    }
};

$(document).ready(ready);
$(document).on('page:load', ready);