beforeEach(function() {
  this.addMatchers({
    toBeVisible: function() {
      this.message = function() { return "expected " + this.actual[0] + " to be visible but it was not."; };
      return this.actual.is(":visible")
    },
    toBeHidden: function() {
      this.message = function() { return "expected " + this.actual[0] + " to be hidden but it was not."; };
      return !this.actual.is(":visible");
    },
    toAllBeHidden: function() {
      for (var i = 0; i < this.actual.length; i++) {
        if ($(this.actual[i]).is(":visible")) {
          this.message = function() { return "expected " + this.actual[i] + " to be hidden but it was not."; };
          return false;
        }
      }
      return true;
    },
    toChange: function(opts) {
      var before = opts.fn();
      this.actual();
      var after = opts.fn();

      this.message = function() {
        return "expected value to change from '" + opts.from + "' to '" + opts.to + "' but changed from '" + before + "' to '" + after + "'.";
      };

      return before == opts.from && after == opts.to;
    },
    toNotChange: function(fn) {
      var before = fn();
      this.actual();
      var after = fn();

      this.message = function() {
        return "expected value to not change.";
      };

      return before == after;
    },
    toHaveBeenSubmitted: function(fn) {
      this.message = function() { return "expected " + this.actual[0] + " to have been submitted, and was not"; };
      var caught;
      if( this.actual.data('caught-submit') ) {
        caught = true;
      } else {
        caught = false;
      }
      return caught;
    }
  });
});

afterEach(function() {
  $('#jasmine_content').empty();
});

function addHtml(html) {
  var snippet = $(html);
  $('#jasmine_content').append(snippet);
  return snippet;
}

function catchSubmission(form) {
  form.data('caught-submit', false);
  form.bind("submit", function(event) {
    if (!event.isDefaultPrevented()) {
      form.data('caught-submit', true);
    }
    event.preventDefault();
  });
}


(function($) {
  $.fn.simulate_keypress = function(character) {
    var $this = $(this);
    $this.keydown();
    $this.keypress();
    $this.val($this.val() + character);
    $this.keyup();
  };

  $.fn.simulate_backspace = function() {
    var $this = $(this);
    $this.keydown();
    $this.val($this.val().substr(0, $this.val().length - 1));
    $this.keyup();
  };
})(jQuery);