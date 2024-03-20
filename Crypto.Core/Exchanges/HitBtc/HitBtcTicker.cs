﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CryptoMarketClient.Common;

namespace CryptoMarketClient.HitBtc {
    public class HitBtcTicker : TickerBase {
        public override string Name => MarketCurrency + "_" + BaseCurrency;
        string marketName = null;
        public override string MarketName {
            get {
                if(string.IsNullOrEmpty(marketName))
                    marketName = MarketCurrency + BaseCurrency;
                return marketName;
            }
            set { }
        }
        public override string CurrencyPair { get { return Name; } set { } }

        public override decimal Fee => 0.1m * 0.01m;

        HitBtcBalanceInfo firstInfo, secondInfo;
        public override BalanceBase BaseBalanceInfo {
            get {
                if(firstInfo == null)
                    firstInfo = HitBtcModel.Default.Balances.FirstOrDefault((b) => b.Currency == BaseCurrency);
                return firstInfo;
            }
        }
        public override BalanceBase MarketBalanceInfo {
            get {
                if(secondInfo == null)
                    secondInfo = HitBtcModel.Default.Balances.FirstOrDefault((b) => b.Currency == MarketCurrency);
                return secondInfo;
            }
        }

        public override decimal BaseCurrencyBalance {
            get { return BaseBalanceInfo == null ? 0 : BaseBalanceInfo.Available; }
        }

        public override decimal MarketCurrencyTotalBalance {
            get { return MarketBalanceInfo == null ? 0 : MarketBalanceInfo.Available; }
        }

        public override decimal MarketCurrencyBalance {
            get { return MarketBalanceInfo == null ? 0 : MarketBalanceInfo.Available; }
        }


        public override bool MarketCurrencyEnabled => true;
        public override string HostName => "HitBtc";
        public override string WebPageAddress => "https://www.livecoin.net/en/trade/index?currencyPair=";
        public decimal Step { get; set; }
        public override bool Buy(decimal lowestAsk, decimal amount) {
            throw new NotImplementedException();
        }

        public override string DownloadString(string address) {
            throw new NotImplementedException();
        }

        public override string GetDepositAddress(CurrencyType type) {
            throw new NotImplementedException();
        }

        public override void ProcessArbitrageOrderBook(string text) {
            throw new NotImplementedException();
        }

        public override void ProcessOrderBook(string text) {
            throw new NotImplementedException();
        }

        public override bool Sell(decimal highestBid, decimal amount) {
            throw new NotImplementedException();
        }

        public override bool UpdateArbitrageOrderBook(int depth) {
            return HitBtcModel.Default.UpdateArbitrageOrderBook(this, depth);
        }

        public override bool UpdateBalance(CurrencyType type) {
            throw new NotImplementedException();
        }

        public override void UpdateOrderBook(int depth) {
            throw new NotImplementedException();
        }

        public override void UpdateTicker() {
            throw new NotImplementedException();
        }

        public override void UpdateTrades() {
            throw new NotImplementedException();
        }

        public override bool UpdateTradeStatistic() {
            return HitBtcModel.Default.UpdateTradesStatistic(this, 100);
        }

        public override bool Withdraw(string currency, string address, decimal amount) {
            throw new NotImplementedException();
        }
    }
}
