$(function() {
  var Preview = function() {
    this.$amountNet = $(".amount-net");
    this.$amountFee = $(".amount-fee");
    this.$amountTotal = $(".amount-total");
  };

  Preview.prototype = {
    run: function(options) {
      var fee = options.transactionFee;
      var donationAmount = options.donationAmount;
      var netAmount = options.netAmount;

      if (donationAmount === 0) {
        fee = 0;
        netAmount = 0;
      }

      this.$amountNet.html(this._formatMoney(netAmount));
      this.$amountFee.html(this._formatMoney(fee));
      this.$amountTotal.html(this._formatMoney(donationAmount));
    },

    _formatMoney: function(value) {
      return value.toFixed(2);
    }
  };

  window.Derma.Donations.Preview = Preview;
});
