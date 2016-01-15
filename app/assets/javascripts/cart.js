var ready;
ready = function () {
    $('.increase_quantity').click(function(){
        var $quantity_element = $(this).parent().prev();
        var quantity = parseFloat($quantity_element.text());
        quantity += 1;
        $quantity_element.text(quantity);

        var $price_element = $quantity_element.parent().next();
        var price = parseFloat($price_element.text());
        price = price + (price / (quantity - 1));
        $price_element.text(price);
    });

    $('.decrease_quantity').click(function(){
        var $quantity_element = $(this).parent().next();
        var quantity = parseInt($quantity_element.text());
        if( quantity > 0 ) {
            quantity -= 1;
        }
        $quantity_element.text(quantity);

        var $price_element = $quantity_element.parent().next();
        var price = parseFloat($price_element.text());
        if( quantity > 0 ) {
            price = price - (price / (quantity + 1));
            $price_element.text(price);
        }
        else {
            $(this).parent().parent().parent().parent().parent().append('Корзина пуста');
            $(this).parent().parent().parent().hide();
        }

    });

};

$(document).ready(ready);
$(document).on('page:load', ready);