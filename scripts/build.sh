#!/bin/bash -eu

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. &>/dev/null && pwd)"
PROJ_ROOT=$ROOT_DIR/tl_zigbee_sdk
cd $PROJ_ROOT

if [[ $# -gt 0 && $1 == clean ]]; then
    TARGET=clean
else
    TARGET=all
fi

# tlsr_riscv for TLSR9 series chips, tlsr_tc32 for TLSR8.
PLATFORM_DIR=${PROJ_ROOT}/build/tlsr_riscv

FILE_PATH="${PROJ_ROOT}/apps/common/comm_cfg.h"
sed -i -E "s/^(#define BOOT_LOADER_MODE\s+)[01]/\11/" "$FILE_PATH"

# Bootloader
cd "${PLATFORM_DIR}/bootLoader_B91"
make -j4 $TARGET

cd "${PLATFORM_DIR}"
sed -i -E "s/^(#define BOOT_LOADER_MODE\s+)[01]/\10/" "$FILE_PATH"

# Coordinator
cd "${PLATFORM_DIR}/sampleGW_B91"
make -j4 $TARGET

# Router
cd "${PLATFORM_DIR}/sampleLight_B91"
make -j4 $TARGET

# End Device
cd "${PLATFORM_DIR}/sampleSwitch_B91"
make -j4 $TARGET

# End Device
cd "${PLATFORM_DIR}/sampleContactSensor_B91"
make -j4 $TARGET
