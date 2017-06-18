$(function() {
  var Calculator = function() {
    this.preview = new window.Derma.Donations.Preview();
  };

  Calculator.prototype = {
    run: function(options) {
      var netAmount = options.donationAmount - options.transactionFee;
      var values = $.extend(options, { netAmount: netAmount });

      this.preview.run(values);
    }
  };

  window.Derma.Donations.Calculator = Calculator;
});
