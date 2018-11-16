#!/bin/bash

connectedDev=$(hcitool con)
conMac=${connectedDev:20:18}
echo $conMac