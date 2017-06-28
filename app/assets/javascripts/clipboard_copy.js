$(function() {
  var ClipboardCopy = function(link, status) {
    this.link = link;
    this.$status = $(status);
  };

  ClipboardCopy.prototype = {
    initialize: function() {
      var _this = this;
      var clipboard = new Clipboard(this.link);

      $(this.link).on("click", function(e) {
        e.preventDefault();
      });

      clipboard.on("success", function(e) {
        _this.$status.show(1).delay(1000).hide(1);

        e.clearSelection();
      });
    }
  };

  window.Derma.ClipboardCopy = ClipboardCopy;
});
