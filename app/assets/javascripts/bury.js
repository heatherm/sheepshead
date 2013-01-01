(function ($) {
  $.fn.selectCard = function () {
    $(this).click(function (event) {
      event.preventDefault();
      var card = $(this);
      card.toggleClass('picked');
      if ($('.picked').length > 2) {
        card.toggleClass('picked');
        $('.blind h5').text('Select two cards and click \'Bury\'. ' +
          'Only 2 cards allowed. Deselect if needed.');
      } else {
        $('.blind h5').text('Select two cards and click \'Bury\'.');
        var cardName = card.data("name");
        var buryList = $('.blind .area');
        var cardText = '[ ' + cardName + ' ]';
        if (card.hasClass('picked')) {
          buryList.append(cardText);
        } else {
          buryList.contents()
            .filter(function (index, item) {
              return this.nodeType == 3 && $(item).text() == $("<div/>").html(cardText).text();
            }).remove();
        }
      }
    });
    return this;
  };

  $.fn.doBury = function () {
    $(this).click(function (event) {
      event.preventDefault();
      var pickedCards = $('.picked');
      if (pickedCards.length != 2){
        $('.blind h5').text('Select two cards and click \'Bury\'. Please select 2 cards.');
      } else {
        var pickedIds = _.map(pickedCards, function(card){return $(card).data('id')});
        $('.blind input.cards').val(pickedIds);
        $('.blind form').submit();
      }
    });
  };
})(jQuery);