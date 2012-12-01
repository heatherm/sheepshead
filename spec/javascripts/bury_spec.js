describe("burying", function() {
  describe("#selectCard", function() {
    beforeEach(function() {
      addHtml(
          '<div class="card" style="left:11em;top:.25em;">'+
          '    <div class="front " data-name="jack &amp;clubs;" style="">'+
          '        <div class="index">J<br>♣</div>'+
          '        <img alt="jack" class="face" src="assets/jack.gif">'+
          '        <div class="spotA1">♣</div>'+
          '        <div class="spotC5">♣</div>'+
          '    </div>'+
          '</div>'+
          '<div class="bury"><h5></h5></div>'
       );
      $(".front").selectCard();
    });

    it("should add the class 'picked'", function() {
      $(".front").click();
      expect($('.front').hasClass('picked')).toBeTruthy();
    });

    it("should update the list of cards to be burried", function() {
      $(".front").click();
      expect($(".bury").text()).toEqual("jack ♣");
    });
  });
});