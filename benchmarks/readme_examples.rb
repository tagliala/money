# frozen_string_literal: true

module ReadmeExamples
  def self.call
    money = Money.from_cents(1000, "USD")
    money.cents     #=> 1000
    money.currency  #=> Currency.new("USD")

    Money.from_cents(1000, "USD") == Money.from_cents(1000, "USD")   #=> true
    Money.from_cents(1000, "USD") == Money.from_cents(100, "USD")    #=> false
    Money.from_cents(1000, "USD") == Money.from_cents(1000, "EUR")   #=> false
    Money.from_cents(1000, "USD") != Money.from_cents(1000, "EUR")   #=> true

    Money.from_cents(1000, "USD") + Money.from_cents(500, "USD") == Money.from_cents(1500, "USD")
    Money.from_cents(1000, "USD") - Money.from_cents(200, "USD") == Money.from_cents(800, "USD")
    Money.from_cents(1000, "USD") / 5                            == Money.from_cents(200, "USD")
    Money.from_cents(1000, "USD") * 5                            == Money.from_cents(5000, "USD")

    Money.from_amount(5, "USD") == Money.from_cents(500, "USD")  # 5 USD
    Money.from_amount(5, "JPY") == Money.from_cents(5, "JPY")    # 5 JPY
    Money.from_amount(5, "TND") == Money.from_cents(5000, "TND") # 5 TND

    Money.from_cents(1000, "USD").with_currency("EUR") == Money.from_cents(1000, "EUR")

    Money.from_cents(100, "USD").format #=> "$1.00"
    Money.from_cents(100, "GBP").format #=> "£1.00"
    Money.from_cents(100, "EUR").format #=> "€1.00"
  end
end
