#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Home Panel
# This updates the internal auth secret for the API
# ==============================================================================
if [ "$(grep -i 'API_AUTH_SECRET' /opt/panel/config/default.json)" = 0 ]; then
    bashio::log.info "Update auth secret.."
    sed -i -e "s/API_AUTH_SECRET/$(openssl rand -base64 32)/g" /opt/panel/config/default.json
fi

# Force database to use /data
sed -i "s#../db#/data#g" /opt/panel/config/default.json
