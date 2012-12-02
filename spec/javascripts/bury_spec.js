describe("burying", function () {
  beforeEach(function () {
    addHtml(
      '<div class="card" style="left:11em;top:.25em;">' +
        '    <div class="front one" data-name="jack &amp;clubs;" data-id="1" style="">' +
        '        <div class="index">J<br>♣</div>' +
        '        <div class="spotA1">♣</div>' +
        '        <div class="spotC5">♣</div>' +
        '    </div>' +
        '</div>' +
        '<div class="card" style="left:11em;top:.25em;">' +
        '    <div class="front two" data-name="king &amp;spades;" data-id="2" style="">' +
        '        <div class="index">J<br>♠</div>' +
        '        <div class="spotA1">♠</div>' +
        '        <div class="spotC5">♠</div>' +
        '    </div>' +
        '</div>' +
        '<div class="card" style="left:11em;top:.25em;">' +
        '    <div class="front three" data-name="queen &amp;spades;" data-id="3" style="">' +
        '        <div class="index">Q<br>♠</div>' +
        '        <div class="spotA1">♠</div>' +
        '        <div class="spotC5">♠</div>' +
        '    </div>' +
        '</div>' +
        '<div class="bury">' +
        '<h5>Select two cards and click \'Bury\'</h5>' +
        '<div class="area">' +
        '<div class="btn"></div>'+
        '</div>'
    );
    $(".front").selectCard();
    $(".btn").doBury();
  });

  describe("#selectCard", function () {
    it("should add the class 'picked' to the selected card", function () {
      $(".front.one").click();
      expect($('.front.one').hasClass('picked')).toBeTruthy();
      expect($('.front.two').hasClass('picked')).toBeFalsy();
    });

    it("should update the list of cards to be burried", function () {
      $(".front.one").click();
      expect($(".bury .area").text()).toEqual("[ jack ♣ ]");
    });

    it("should remove the class 'picked' from the deselected card", function () {
      $(".front.two").click();
      $(".front.one").click();
      $(".front.one").click();
      expect($('.front.two').hasClass('picked')).toBeTruthy();
      expect($('.front.one').hasClass('picked')).toBeFalsy();
    });

    it("should remove the card text from the bury section when deselected", function () {
      $(".front.one").click();
      $(".front.one").click();
      expect($('.bury area').text()).toEqual('');
    });

    it("should not remove cards that are still selected", function () {
      $(".front.one").click();
      $(".front.two").click();
      $(".front.one").click();
      expect($('.bury .area').text()).toEqual('[ king ♠ ]');
    });

    it("should not allow more than two picked cards", function () {
      $(".front.one").click();
      $(".front.two").click();
      $(".front.three").click();
      expect($('.bury h5').text()).toEqual('Select two cards and click \'Bury\'. Only 2 cards allowed. Deselect if needed.');
      expect($('.bury .area').text()).toEqual('[ jack ♣ ][ king ♠ ]');
    });
  });

  describe("#bury", function () {
    it("should require 2 cards exactly", function(){
      $(".front.one").click();
      $(".btn").click();
      expect($('.bury h5').text()).toEqual('Select two cards and click \'Bury\'. Please select 2 cards.');
    });

    it("should serialize the picked cards and send in ids", function(){
      $(".front.one").click();
      $(".front.two").click();

      var ajaxSpy = spyOn($, "ajax");
      expect(ajaxSpy).not.toHaveBeenCalled();

      $(".btn").click();
      expect(ajaxSpy).toHaveBeenCalled();
      expect(ajaxSpy.mostRecentCall.args[0]["data"]).toEqual({ "ids" : [1, 2] });
      expect(ajaxSpy.mostRecentCall.args[0]["url"]).toEqual("/bury");
      expect(ajaxSpy.mostRecentCall.args[0]["type"]).toEqual("PUT");
    });
  });
});