/*
 * Copyright (c) 2018-2019, The Mybtcfx Developers.
 * Portions Copyright (c) 2012-2017, The CryptoNote Developers, The Bytecoin Developers.
 *
 * This file is part of 4xBIT.
 *
 * This file is subject to the terms and conditions defined in the
 * file 'LICENSE', which is part of this source code package.
 */

#pragma once

#include <time.h>

namespace CryptoNote {

  struct ITimeProvider {
    virtual time_t now() = 0;
    virtual ~ITimeProvider() {}
  };

  struct RealTimeProvider : public ITimeProvider {
    virtual time_t now() override {
      return time(nullptr);
    }
  };

}
