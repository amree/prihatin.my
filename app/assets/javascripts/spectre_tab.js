$(function() {
  var SpectreTab = function() {
    this.$container = $("ul.tab");
    this.$contents = $(".tab-contents");
  };

  SpectreTab.prototype = {
    initialize: function() {
      this._onlyShowActive();
      this._bindEvents();
    },

    _bindEvents: function() {
      var _this = this;
      var target = "";

      _this.$container.find("a").on("click", function(e) {
        target = $(this).data("target");

        _this._toggleTabs($(this));
        _this._toggleContents(target);

        e.preventDefault();
      });
    },

    _onlyShowActive: function() {
      var $activeTab = this.$container.find(".tab-item.active > a");
      var target = $activeTab.data("target");

      this._toggleTabs($activeTab);
      this._toggleContents(target);
    },

    _toggleTabs: function($activeTab) {
      this.$container.find("li").removeClass("active");
      $activeTab.parent().addClass("active");
    },

    _toggleContents: function(target) {
      this.$contents.children().hide();
      $(".tab-contents > #" + target).show();
    }
  };

  window.Derma.SpectreTab = SpectreTab;
});
