

if [ "${HTTP_ADAPTOR_URL}" != "" ]; then \
    echo "${IP_GATEWAY} ${HTTP_ADAPTOR_URL}" >> /etc/hosts && \
    echo "${IP_GATEWAY} ${HTTP_ADAPTOR_URL}" \
;fi