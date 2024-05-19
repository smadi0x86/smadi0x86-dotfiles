#!/bin/bash

ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'