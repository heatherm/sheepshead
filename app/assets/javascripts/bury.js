(function ($) {
  $.fn.selectCard = function () {
    $(this).click(function (event) {
      event.preventDefault();
      var card = $(this);
      card.toggleClass('picked');
      var cardName = card.data("name");
      var buryList = $('.bury .area');
      var cardText = '[ '+ cardName +' ]';
      if (card.hasClass('picked')) {
        buryList.append(cardText);
      } else {
        buryList.contents()
          .filter(function (index, item) {
            return this.nodeType == 3 && $(item).text() == $("<div/>").html(cardText).text();
          }).remove();
      }
    });
    return this;
  };
})(jQuery);