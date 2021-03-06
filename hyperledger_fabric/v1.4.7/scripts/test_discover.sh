#!/bin/bash

# Importing useful functions for cc testing
if [ -f ./func.sh ]; then
 source ./func.sh
elif [ -f scripts/func.sh ]; then
 source scripts/func.sh
fi

# test sideDB feature

#chaincodeInstantiate "${APP_CHANNEL}" 1 0 ${CC_MARBLES_NAME} ${CC_INIT_VERSION} ${CC_MARBLES_INIT_ARGS} ${CC_MARBLES_COLLECTION_CONFIG}

# both org1 and org2 can invoke
#chaincodeInvoke ${APP_CHANNEL} 1 0 ${CC_MARBLES_NAME} ${CC_MARBLES_INVOKE_INIT_ARGS}

#chaincodeInvoke ${APP_CHANNEL} 1 0 ${CC_MARBLES_NAME} ${CC_MARBLES_INVOKE_INIT_ARGS}

#chaincodeQuery ${APP_CHANNEL} 1 0 ${CC_MARBLES_NAME} ${CC_MARBLES_QUERY_READPVTDETAILS_ARGS}
#chaincodeQuery ${APP_CHANNEL} 2 0 ${CC_MARBLES_NAME} ${CC_MARBLES_QUERY_READ_ARGS}
#chaincodeQuery 1 0 "${ORG1_PEER0_URL}" "${ORG1_PEER0_TLS_ROOTCERT}" ${APP_CHANNEL} ${CC_MARBLES_NAME} ${CC_MARBLES_QUERY_READPVTDETAILS_ARGS_2}

CC_NAME=${CC_NAME:-$CC_02_NAME}

cd /etc/hyperledger/fabric/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com

USER_KEY=`ls msp/keystore`

discover \
    --peerTLSCA tls/ca.crt \
    --userKey msp/keystore/${USER_KEY} \
    --userCert msp/signcerts/Admin\@org1.example.com-cert.pem \
    --MSP Org1MSP \
    --tlsCert tls/client.crt \
    --tlsKey tls/client.key \
    endorsers \
    --server peer0.org1.example.com:7051 \
    --channel ${APP_CHANNEL} \
    --chaincode ${CC_NAME}

exit
