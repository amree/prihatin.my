$(function() {
  var FacebookShare = function() {
    this.$shareLinks = $(".js-fb-share");
  };

  FacebookShare.prototype = {
    initialize: function() {
      this._bindEvents();
    },

    _bindEvents: function() {
      var _this = this;

      this.$shareLinks.each(this._bindShareAction);
    },

    _bindShareAction: function() {
      var url = "";

      $(this).on("click", function(e) {
        url = $(this).data("url");

        FB.ui({
          method: "feed",
          link: url
        }, function(response) {});

        e.preventDefault();
      })
    }
  };

  window.Derma.FacebookShare = FacebookShare;
});
