$(function() {
  var Form = function() {
    this.$customDonationAmountRadio =
      $("form input[name='custom_donation_amount_flag']");
    this.$customDonationAmountField =
      $("#donation_custom_donation_amount");
    this.$donationAmountOptions =
      $("input[name='donation[donation_amount]'][type='radio']");

    this.calculator = new window.Derma.Donations.Calculator();
  };

  Form.prototype = {
    initialize: function() {
      this._bindEvents();
      this._onLoadSetup();
      this._calculate();
    },

    _onLoadSetup: function() {
      this._enableCustomDonationAmount(false);
    },

    _bindEvents: function() {
      var _this = this;

      this.$customDonationAmountRadio.on("click", function(e) {
        _this.$donationAmountOptions.each(function(index, value) {
          $(this).prop("checked", false);
        });

        _this._enableCustomDonationAmount(true);
        _this._calculate();
      });

      this.$donationAmountOptions.on("click", function(e) {
        _this._enableCustomDonationAmount(false);
        _this._calculate();
      });

      this.$customDonationAmountField.on("input", function(e) {
        _this._calculate();
      })
    },

    _enableCustomDonationAmount: function(enable) {
      if (enable) {
        this.$customDonationAmountField.prop("disabled", false);
      } else {
        this.$customDonationAmountRadio.prop("checked", false);
        this.$customDonationAmountField.prop("disabled", true);
        this.$customDonationAmountField.val("");
      }
    },

    _calculate: function() {
      var options = {
        donationAmount: this._donationAmount(),
        transactionFee: 1.5
      };

      this.calculator.run(options);
    },

    _donationAmount: function() {
      var amount = 0;

      if (this.$customDonationAmountRadio.is(":checked")) {
        amount = parseInt(this.$customDonationAmountField.val(), 10) || 0
      } else {
        this.$donationAmountOptions.each(function() {
          if ($(this).is(":checked")) {
            amount = parseInt($(this).val(), 10);

            return false;
          }
        });
      }

      return amount;
    }
  };

  window.Derma.Donations.Form = Form;
});
