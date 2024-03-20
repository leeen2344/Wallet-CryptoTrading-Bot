﻿using Crypto.Core.Exchanges.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Crypto.Core.Exchanges.Exmo {
    public class ExmoCurrencyInfo : CurrencyInfo {
        public ExmoCurrencyInfo(Exchange e, string currency) : base(e, currency) { }
    }
}
