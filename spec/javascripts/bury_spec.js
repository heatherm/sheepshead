describe("burying", function() {
  describe("#selectCard", function() {
    beforeEach(function() {
      addHtml(
          '<div class="card" style="left:11em;top:.25em;">'+
          '    <div class="front one" data-name="jack &amp;clubs;" style="">'+
          '        <div class="index">J<br>♣</div>'+
          '        <div class="spotA1">♣</div>'+
          '        <div class="spotC5">♣</div>'+
          '    </div>'+
          '</div>'+
          '<div class="card" style="left:11em;top:.25em;">'+
          '    <div class="front two" data-name="king &amp;spades;" style="">'+
          '        <div class="index">J<br>♠</div>'+
          '        <div class="spotA1">♠</div>'+
          '        <div class="spotC5">♠</div>'+
          '    </div>'+
          '</div>'+
          '<div class="card" style="left:11em;top:.25em;">'+
          '    <div class="front three" data-name="queen &amp;spades;" style="">'+
          '        <div class="index">Q<br>♠</div>'+
          '        <div class="spotA1">♠</div>'+
          '        <div class="spotC5">♠</div>'+
          '    </div>'+
          '</div>'+
          '<div class="bury"><div class="area"></div>'
       );
      $(".front").selectCard();
    });

    it("should add the class 'picked' to the selected card", function() {
      $(".front.one").click();
      expect($('.front.one').hasClass('picked')).toBeTruthy();
      expect($('.front.two').hasClass('picked')).toBeFalsy();
    });

    it("should update the list of cards to be burried", function() {
      $(".front.one").click();
      expect($(".bury").text()).toEqual("[ jack ♣ ]");
    });

    it("should remove the class 'picked' from the deselected card", function() {
      $(".front.two").click();
      $(".front.one").click();
      $(".front.one").click();
      expect($('.front.two').hasClass('picked')).toBeTruthy();
      expect($('.front.one').hasClass('picked')).toBeFalsy();
    });

    it("should remove the card text from the bury section when deselected", function() {
      $(".front.one").click();
      $(".front.one").click();
      expect($('.bury area').text()).toEqual('');
    });

    it("should not remove cards that are still selected", function() {
      $(".front.one").click();
      $(".front.two").click();
      $(".front.one").click();
      expect($('.bury .area').text()).toEqual('[ king ♠ ]');
    });
  });
});