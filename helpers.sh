#!/bin/bash
CL_RED="\E[1;31m";
CL_GREEN="\e[92m";
CL_WHITE='\e[1;37m'
CL_CLEAR="\e[m";
CL_YELLOW='\e[1;33m';
CL_PURPLE='\e[1;35m';

function logRed {
  echo -e $CL_RED$1$CL_CLEAR;
}
function logGreen {
  echo -e $CL_GREEN$1$CL_CLEAR;
}
function logYellow {
  echo -e $CL_YELLOW$1$CL_CLEAR;
}
function logPurple {
  echo -e $CL_PURPLE$1$CL_CLEAR;
}
function logWhite {
  echo -e $CL_WHITE$1$CL_CLEAR;
}
function actionMessage {
  echo -e $CL_GREEN"----------------------- "$1" -----------------------"$CL_CLEAR;
}
