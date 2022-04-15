#ifndef RTCFG_CONSUL_CLIENT_H
#define RTCFG_CONSUL_CLIENT_H

#include "spdlog/spdlog.h"
#include "defines.h"
#include "constants/constants.h"
#include "http/http_client.h"
#include "utils/utils.h"

namespace rtcfg::consul {
    struct ConsulConfig {
        String host;
        String kv_url;
    };

    class ConsulClient {
    private:
        ConsulConfig config;
        HTTPClient http_client;
    public:
        explicit ConsulClient(const SSMap &props) {
            config = ConsulConfig{
                    GET_OR_DEFAULT(props, KEY_HOST, CONSUL_DEFAULT_URL),
                    GET_OR_DEFAULT(props, KEY_HOST, CONSUL_DEFAULT_URL) + CONSUL_KV_PREFIX
            };
        }

        String GetKV(const String &key);
    };
}

#endif //RTCFG_CONSUL_CLIENT_H