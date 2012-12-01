(function($) {
  $.fn.selectCard = function() {
    $(this).click(function(event) {
      event.preventDefault();
      var card = $(this);
      card.addClass('picked');
      var cardName = card.data("name");
      $('.bury h5').append('<br/>');
      $('.bury h5').append(cardName)
    });
    return this;
  };
})(jQuery);